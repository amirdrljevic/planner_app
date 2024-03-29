require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PlannerApp
  class Application < Rails::Application

    config.assets.debug = true
    config.assets.compile = true
    config.assets.check_precompiled_asset = false
    config.assets.precompile += %w( application.scss )

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.active_storage.variant_processor = :mini_magick

    #this is to keep uploaded files on meeting model after editing a meeting:
    config.active_storage.replace_on_assign_to_many = false
    config.after_initialize do |_config|
      User.update_all(status: User.statuses[:offline])
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
