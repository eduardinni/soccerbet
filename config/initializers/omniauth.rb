OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["FB_PUBLIC_KEY"], ENV["FB_PRIVATE_KEY"], {provider_ignores_state: true}
end

