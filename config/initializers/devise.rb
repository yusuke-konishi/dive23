Devise.setup do |config|
  
  config.secret_key = '6726fb7b3f015ad8e9f4c5f231051a6e959ad045e038a615402b07e98eb9ac0a42f9ff5c077b0c9346b29272fd4c274740019900314ec1cf3ee8f0db8543ac44'
  config.mailer_sender = 'noreply@yourdomain'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  if Rails.env.production?
    config.omniauth :facebook, ENV["FACEBOOK_ID_PRODUCTION"], ENV["FACEBOOK_SECRET_PRODUCTION"], scope: 'email', display: 'popup', info_fields: 'name, email'
    config.omniauth :google_oauth2, ENV["GOOGLE_ID_PRODUCTION"], ENV["GOOGLE_SECRET_PRODUCTION"], scope: 'email', display: 'popup', info_fields: 'name, email'
  else
    config.omniauth :facebook, ENV["FACEBOOK_ID_DEVELOPMENT"], ENV["FACEBOOK_SECRET_DEVELOPMENT"], scope: 'email', display: 'popup', info_fields: 'name, email'
    config.omniauth :google_oauth2, ENV["GOOGLE_ID_DEVELOPMENT"], ENV["GOOGLE_SECRET_DEVELOPMENT"], scope: 'email', display: 'popup', info_fields: 'name, email'
  end
end
