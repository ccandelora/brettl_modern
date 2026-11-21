require "test_helper"

class ContactMailerTest < ActionMailer::TestCase
  self.fixture_table_names = []

  test "builds an inquiry email with a safe reply address" do
    contact = ContactForm.new(
      name: "Taylor Ski",
      email: "taylor@example.com",
      phone: "603-555-0144",
      preferred_contact_method: "phone",
      source: "Meetup",
      activities: [ "Hiking", "Other" ],
      activity_other: "Trail clean-ups",
      joke: "I would love to join a hike this fall.",
      newsletter: true
    )

    email = ContactMailer.inquiry(contact)

    assert_equal [ "brettl.hupfers@gmail.com" ], email.to
    assert_equal [ "taylor@example.com" ], email.reply_to
    assert_equal "New website contact from Taylor Ski", email.subject
    assert_includes email.text_part.body.encoded, "Newsletter opt-in: Yes"
    assert_includes email.html_part.body.encoded, "New website message"
    assert_includes email.html_part.body.encoded, "Trail clean-ups"
    assert_includes email.html_part.body.encoded, "I would love to join a hike this fall."
  end
end
