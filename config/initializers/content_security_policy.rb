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
      # Production CSP - allow unsafe-inline for styles due to inline styles in templates
      policy.script_src  :self, :https, "https://connect.facebook.net", :unsafe_eval
      policy.style_src   :self, :https, :unsafe_inline
    end

    policy.connect_src :self, :https, "https://connect.facebook.net", "https://facebook.com", "https://www.facebook.com"
    policy.frame_src   :self, :https, "https://www.facebook.com", "https://web.facebook.com"
    # Specify URI for violation reports
    # policy.report_uri "/csp-violation-report-endpoint"
  end

  # Use proper nonce generation in production for scripts only
  if Rails.env.production?
    # Generate secure random nonces for scripts
    config.content_security_policy_nonce_generator = ->(request) { SecureRandom.base64(16) }
    config.content_security_policy_nonce_directives = %w[script-src]
  end

  # Report violations without enforcing the policy.
  # config.content_security_policy_report_only = true
end
