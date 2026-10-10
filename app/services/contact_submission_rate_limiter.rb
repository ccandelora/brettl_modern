require "digest"

class ContactSubmissionRateLimiter
  MAX_SUBMISSIONS_PER_HOUR = 5

  def initialize(ip_address)
    @ip_hash = Digest::SHA256.hexdigest(ip_address.to_s)
    @window_started_at = Time.current.beginning_of_hour
  end

  def allowed?
    ContactSubmissionRateLimit.transaction do
      limit = ContactSubmissionRateLimit.lock.find_by(
        ip_hash: @ip_hash,
        window_started_at: @window_started_at
      )

      if limit
        return false if limit.submissions_count >= MAX_SUBMISSIONS_PER_HOUR

        limit.increment!(:submissions_count)
      else
        ContactSubmissionRateLimit.create!(
          ip_hash: @ip_hash,
          window_started_at: @window_started_at,
          submissions_count: 1
        )
      end
    end

    true
  rescue ActiveRecord::RecordNotUnique
    retry
  end
end
