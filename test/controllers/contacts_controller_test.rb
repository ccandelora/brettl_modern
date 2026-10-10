require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  self.fixture_table_names = []

  test "renders the contact form" do
    get contact_url

    assert_response :success
    assert_select "h1", "Get In Touch"
    assert_select "form[action='#{contact_path}'][method='post']"
  end

  test "delivers a complete contact submission" do
    get contact_url
    token = form_token
    assert_equal "issued_at", Rails.application.message_verifier("contact-form").verify(token).keys.first

    travel 4.seconds do
      payload = Rails.application.message_verifier("contact-form").verify(token)
      assert_operator Time.current.to_f - payload.fetch("issued_at").to_i, :>=, 3.seconds
      post contact_url, params: { form_token: token, contact: complete_contact_params }
    end

    assert_redirected_to contact_url
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_equal "Thanks — we’ll be in touch soon.", flash[:notice]
  end

  test "treats SQL-looking input as ordinary message content" do
    get contact_url
    token = form_token
    malicious_message = "Robert'); DROP TABLE users;--"
    original_user_count = User.count

    travel 4.seconds do
      post contact_url, params: {
        form_token: token,
        contact: complete_contact_params(name: malicious_message, joke: malicious_message)
      }
    end

    assert_redirected_to contact_url
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert User.table_exists?
    assert_equal original_user_count, User.count
  end

  test "rejects a tampered form token without delivering email" do
    get contact_url
    tampered_token = form_token.sub(/.$/, "x")

    travel 4.seconds do
      assert_no_emails do
        post contact_url, params: { form_token: tampered_token, contact: complete_contact_params }
      end
    end

    assert_response :unprocessable_entity
    assert_includes response.body, "Please reload the page and try again."
  end

  test "rejects a filled honeypot without delivering email" do
    get contact_url

    travel 4.seconds do
      assert_no_emails do
        post contact_url, params: {
          form_token: form_token,
          contact: complete_contact_params(website: "https://spam.example")
        }
      end
    end

    assert_response :unprocessable_entity
  end

  test "rejects a submission completed too quickly" do
    get contact_url

    assert_no_emails do
      post contact_url, params: { form_token: form_token, contact: complete_contact_params }
    end

    assert_response :unprocessable_entity
    assert_includes response.body, "Please reload the page and try again."
  end

  test "rate limits the sixth otherwise-valid form submission from one connection" do
    5.times do
      get contact_url

      travel 4.seconds do
        post contact_url, params: { form_token: form_token, contact: complete_contact_params }
      end

      assert_redirected_to contact_url
    end

    assert_equal 5, ActionMailer::Base.deliveries.size

    get contact_url
    travel 4.seconds do
      assert_no_emails do
        post contact_url, params: { form_token: form_token, contact: complete_contact_params }
      end
    end

    assert_response :too_many_requests
    assert_includes response.body, "Too many messages were sent from this connection."
  end

  private

  def form_token
    response.body.match(/name="form_token"[^>]*value="([^"]+)"/)[1]
  end

  def complete_contact_params(overrides = {})
    {
      name: "Taylor Ski",
      email: "taylor@example.com",
      phone: "603-555-0123",
      preferred_contact_method: "email",
      source: "A friend",
      activities: [ "Hiking", "Volleyball" ],
      joke: "Looking forward to learning more.",
      newsletter: "0"
    }.merge(overrides)
  end
end
