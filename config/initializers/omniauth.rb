OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'UNMHvYz4jCnMf871ckug', 'oP5yhG9xFchOnyb3dSxvmqlkTJzVR1GYo30MN9Lsoo'
end