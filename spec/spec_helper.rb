# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

FakeWeb.allow_net_connect = false

FakeWeb.register_uri(:get, 'https://github.com/api/v2/json/repos/show/mnutt/hummingbird',
                     :response => Rails.root.join('spec', 'fixtures', 'repo.json'))

FakeWeb.register_uri(:get, 'https://github.com/api/v2/json/blob/all/mnutt/hummingbird/master',
                     :response => Rails.root.join('spec', 'fixtures', 'blobs.json'))

FakeWeb.register_uri(:get, 'https://github.com/api/v2/json/blob/show/mnutt/hummingbird/118ab6fdd1521123e178bcd883d06cde69b16e13',
                     :response => Rails.root.join('spec', 'fixtures', 'raw.json'))


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # config.use_transactional_fixtures = true
end
