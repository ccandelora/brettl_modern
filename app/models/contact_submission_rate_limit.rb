class ContactSubmissionRateLimit < ApplicationRecord
  validates :ip_hash, presence: true
  validates :window_started_at, presence: true
  validates :submissions_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
