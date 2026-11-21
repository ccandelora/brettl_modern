require "digest"
require "json"
require "net/http"

class MailchimpSubscription
  def initialize(contact)
    @contact = contact
  end

  def subscribe
    return false unless configured?

    http = Net::HTTP.new(api_host, 443)
    http.use_ssl = true
    http.open_timeout = 5
    http.read_timeout = 5

    response = http.start do |connection|
      request = Net::HTTP::Put.new(member_path)
      request["Authorization"] = "Bearer #{api_key}"
      request["Content-Type"] = "application/json"
      request.body = {
        email_address: @contact.email,
        status_if_new: "pending"
      }.to_json
      connection.request(request)
    end

    return true if response.is_a?(Net::HTTPSuccess)

    Rails.logger.error("Mailchimp subscription failed with status #{response.code}")
    false
  rescue StandardError => error
    Rails.logger.error("Mailchimp subscription failed: #{error.class}")
    false
  end

  private

  def configured?
    api_key.present? && audience_id.present? && data_center.present?
  end

  def api_key
    ENV["MAILCHIMP_API_KEY"]
  end

  def audience_id
    ENV["MAILCHIMP_AUDIENCE_ID"]
  end

  def data_center
    api_key.to_s.split("-").last
  end

  def api_host
    "#{data_center}.api.mailchimp.com"
  end

  def member_path
    subscriber_hash = Digest::MD5.hexdigest(@contact.email.downcase)
    "/3.0/lists/#{audience_id}/members/#{subscriber_hash}"
  end
end
