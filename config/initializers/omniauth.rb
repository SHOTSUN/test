Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter, 'dmI4cpkxMuU4uHi03qr6DdM8a',    'B2SaKXMpNQALsohU18b02TM0Fo4GF2Y2IjRF6NxEFtJ94csAEX'
end