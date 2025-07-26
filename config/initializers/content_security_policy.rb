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
      # Production CSP - use nonces for inline scripts and unsafe-inline for styles
      policy.script_src  :self, :https, "https://connect.facebook.net", :unsafe_eval, :nonce
      policy.style_src   :self, :https, :unsafe_inline
    end

    policy.connect_src :self, :https, "https://connect.facebook.net", "https://facebook.com", "https://www.facebook.com"
    policy.frame_src   :self, :https, "https://www.facebook.com", "https://web.facebook.com"
    # Specify URI for violation reports
    # policy.report_uri "/csp-violation-report-endpoint"
  end

  # Generate secure random nonces for scripts in production
  config.content_security_policy_nonce_generator = ->(request) { SecureRandom.base64(16) }
  config.content_security_policy_nonce_directives = %w[script-src]

  # Report violations without enforcing the policy.
  # config.content_security_policy_report_only = true
end
