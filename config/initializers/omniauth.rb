# Create an initializer to store omniauth provider info.
OmniAuth.config.logger = Rails.logger

# Note the last part of the code is specifying something called a ca_file.
# On many systems the SSL certificates can't be found which leads to an OpenSSL error.
# To resolve this, please keep this file in your rails app root. 
# This should resolve any OpenSSL issue that you are experiencing.
# Reference this link: https://gist.github.com/fnichol/867550
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET_KEY'], {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end