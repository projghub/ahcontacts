# Load the rails application
require File.expand_path('../application', __FILE__)

application_settings = YAML.load_file(Rails.root.join('config', 'application_config.yml'))[Rails.env]
APPLICATION_NAME = application_settings['application_name']
APPLICATION_SLOGAN = application_settings['application_slogan']
APPS_URL = application_settings['apps_url']

APPLICATION_DOMAINS = ['ahcontacts.herokuapps.com', 'apps.lvh.me']

#Constants
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

# Initialize the rails application
Ahcontacts::Application.initialize!
