require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/rails"
require 'minitest/pride'
require 'webmock'
require 'vcr'
require 'mocha/mini_test'

class ActiveSupport::TestCase
  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock
    config.allow_http_connections_when_no_cassette = true
  end

  def setup
    create_user
  end

  def create_user
    @user = User.new(id: 1,
    name: "MattsApicuriousacct",
    screen_name: "MattsApicouri",
    oauth_token: ENV["oauth_token"],
    oauth_token_secret: ENV["oauth_token_secret"])
  end

end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def teardown
    reset_session!
    OmniAuth.config.mock_auth[:twitter] = nil
  end
  
end
