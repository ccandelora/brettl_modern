require "test_helper"

class ContactFormTest < ActiveSupport::TestCase
  self.fixture_table_names = []

  test "is valid with the required contact details" do
    contact = ContactForm.new(name: "Taylor Ski", email: "taylor@example.com")

    assert_predicate contact, :valid?
  end

  test "requires a description for another activity" do
    contact = ContactForm.new(
      name: "Taylor Ski",
      email: "taylor@example.com",
      activities: [ "Other" ]
    )

    assert_not_predicate contact, :valid?
    assert_includes contact.errors[:activity_other], "is required when Other is selected"
  end

  test "drops activities outside the approved list" do
    contact = ContactForm.new(
      name: "Taylor Ski",
      email: "taylor@example.com",
      activities: [ "Hiking", "Unexpected value" ]
    )

    assert_equal [ "Hiking" ], contact.activities
  end

  test "rejects control characters in mail-bound fields" do
    contact = ContactForm.new(name: "Taylor\r\nBcc: victim@example.com", email: "taylor@example.com")

    assert_not_predicate contact, :valid?
    assert_includes contact.errors[:name], "contains invalid characters"
  end
end
