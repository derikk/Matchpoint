Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :google_oauth2,
    Rails.application.credentials.google[:CLIENT_ID],
    Rails.application.credentials.google[:CLIENT_SECRET],
    {
      name: "google",
      # fetch_basic_profile: false,
      # scope: "email, profile",
      # scope: "userinfo.email",
      # hosted_domain: "lexingtonma.org"
        # hd: "lexingtonma.org"
    }
  )
end

# CSRF isn't an issue since there is only one way to authenticate
OmniAuth.config.allowed_request_methods = [:get, :post]
OmniAuth.config.silence_get_warning = true
