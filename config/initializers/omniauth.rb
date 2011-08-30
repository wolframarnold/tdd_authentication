# Note: This MUST BE REMOVED if you're using Devise's omniauthable, or Devise will report "invalid credentials" when attempting to log in via Twitter
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'RaRwrok5RQitDkbh01xcnQ', 'yTcovj1k1Lb3XQ4mRyOjIBlApKoQaDCJQCXWV28Sw' # order: Consumer Key, Consumer Secret
  # option: :force_login => true will force a new login into the Provider, even though the Provider may have previously been logged in, from a different browser tab.
end
