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
      # Production CSP - allow unsafe_inline for scripts due to Facebook SDK requirements
      policy.script_src  :self, :https, "https://connect.facebook.net", :unsafe_eval, :unsafe_inline
      policy.style_src   :self, :https, :unsafe_inline
    end

    policy.connect_src :self, :https, "https://connect.facebook.net", "https://facebook.com", "https://www.facebook.com"
    policy.frame_src   :self, :https, "https://www.facebook.com", "https://web.facebook.com"
    # Specify URI for violation reports
    # policy.report_uri "/csp-violation-report-endpoint"
  end

  # Rails 8 compatible nonce configuration
  # Use session ID as nonce for better compatibility (Rails 8 recommendation)
  config.content_security_policy_nonce_generator = ->(request) { request.session.id.to_s }

  # Remove the nonce_directives configuration as it's handled differently in Rails 8
  # config.content_security_policy_nonce_directives = %w[script-src]

  # Report violations without enforcing the policy.
  # config.content_security_policy_report_only = true
end
