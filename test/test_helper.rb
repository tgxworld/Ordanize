ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
