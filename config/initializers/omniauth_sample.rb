# Note: This MUST BE REMOVED if you're using Devise's omniauthable, or Devise will report "invalid credentials" when attempting to log in via Twitter

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'Consumer Key', 'Consumer Secret' # order: Consumer Key, Consumer Secret
  # option: :force_login => true will force a new login into the Provider, even though the Provider may have previously been logged in, from a different browser tab.

  provider :facebook, 'APP ID/API Key', 'App Secret'

  provider :linked_in, 'API Key', 'Secret Key'
end
