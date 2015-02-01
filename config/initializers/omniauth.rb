OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :idme, ENV["IDME_KEY"], ENV["IDME_SECRET"]
end
