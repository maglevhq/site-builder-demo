require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SiteBuilderDemo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Keep track of the main host since the app will host both the application and the rendering sie
    config.x.main_host = ENV['APP_MAIN_HOST']

    # The domains registered in the application must point to one of those addresses
    config.x.dns_domain_address = ENV['DNS_DOMAIN_ADDRESS']
    config.x.dns_domain_alias = ENV['DNS_DOMAIN_ALIAS']

    # Allow any domains created from the application
    config.hosts << config.x.main_host
    config.hosts << ->(host) { Site.exists?(domain: URI("http://#{host}").host) }

    config.host_authorization = {
      exclude: ->(request) { request.path == '/check_domain' || request.path == '/up' }
    }
  end
end
