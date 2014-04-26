require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Bookstore
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # AWS::S3::DEFAULT_HOST.replace "s3-us-west-1.amazonaws.com"

    # AWS::S3::DEFAULT_HOST.replace "s3-us-west-2.amazonaws.com"

    # AWS::S3::Base.establish_connection!(
    #   :access_key_id     => 'AKIAIIBBJOK2E4ZW7YAQ',
    #   :secret_access_key => 'nvr+Y9SoDnz45R9ufevM1SUbxQKK19PvOI9FKu+5'
    # )

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    I18n.enforce_available_locales = true

    #for i18n-js
    config.assets.initialize_on_precompile = true
    config.assets.paths << Rails.root.join('public', 'javascripts')
    
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
