require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Board

  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    config.time_zone = 'Minsk'
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
# config/initializers/locale.rb

I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
I18n.available_locales = [:en, :ru]
I18n.default_locale = :en
