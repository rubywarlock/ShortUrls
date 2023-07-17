require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module ShortUrlApp
  class Application < Rails::Application
    # config.load_defaults 5.1
    config.load_defaults 6.1


    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
