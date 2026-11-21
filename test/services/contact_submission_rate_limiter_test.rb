require "test_helper"

class ContactSubmissionRateLimiterTest < ActiveSupport::TestCase
  self.fixture_table_names = []

  test "permits five submissions per IP per hour and blocks the sixth" do
    limiter = ContactSubmissionRateLimiter.new("203.0.113.10")

    5.times { assert_predicate limiter, :allowed? }

    assert_not_predicate limiter, :allowed?
  end

  test "does not expose the original IP address in the database" do
    ContactSubmissionRateLimiter.new("203.0.113.11").allowed?
    record = ContactSubmissionRateLimit.order(:created_at).last

    assert_not_equal "203.0.113.11", record.ip_hash
    assert_match(/\A[0-9a-f]{64}\z/, record.ip_hash)
  end
end
