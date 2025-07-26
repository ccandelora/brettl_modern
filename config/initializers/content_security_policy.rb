# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

Rails.application.configure do
  config.content_security_policy do |policy|
    policy.default_src :self, :https
    policy.font_src    :self, :https, :data
    policy.img_src     :self, :https, :data, :blob, "https://*.fbcdn.net", "https://*.facebook.com"
    policy.object_src  :none

    if Rails.env.development?
      # More permissive CSP for development
      policy.script_src  :self, :https, "https://connect.facebook.net", :unsafe_eval, :unsafe_inline
      policy.style_src   :self, :https, :unsafe_inline
    else
      # Production CSP - simplified for Rails 8 compatibility
      policy.script_src  :self, :https, "https://connect.facebook.net", :unsafe_eval, :unsafe_inline
      policy.style_src   :self, :https, :unsafe_inline
    end

    policy.connect_src :self, :https, "https://connect.facebook.net", "https://facebook.com", "https://www.facebook.com"
    policy.frame_src   :self, :https, "https://www.facebook.com", "https://web.facebook.com"
    # Specify URI for violation reports
    # policy.report_uri "/csp-violation-report-endpoint"
  end

  # Simplified nonce generator - only if needed
  # config.content_security_policy_nonce_generator = ->(request) do
  #   SecureRandom.hex(16)
  # end

  # Temporarily disabled nonce directives for Rails 8 compatibility
  # config.content_security_policy_nonce_directives = %w[script-src]

  # Report violations without enforcing the policy.
  # config.content_security_policy_report_only = true
end
