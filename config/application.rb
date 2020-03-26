require_relative 'boot'

require 'rails/all'

require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NextgenDatabase
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Load i18n translation files
    config.i18n.load_path +=
      Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    
    # To allow the new locales to be loaded
    config.i18n.available_locales = [:en, :fr]

    # Set the default locale to English
    config.i18n.default_locale = :en

  end
end
