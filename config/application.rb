require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'active_record/railtie'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module OctoCat
  class Application < Rails::Application
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    config.middleware.use Rack::MobileDetect
    config.middleware.use Rack::PageSpeed, :public => Rails.public_path do
      store :disk => Rails.root.join('tmp').to_s
      inline_css
    end
  end
end
