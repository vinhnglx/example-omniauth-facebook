# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load the Rails environments
env = File.join(Rails.root, 'config', 'env', "#{Rails.env}.rb")
load(env) if File.exists?(env)

# Initialize the Rails application.
ExampleOmniauthFacebook::Application.initialize!
