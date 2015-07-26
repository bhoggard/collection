require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rg'
require 'minitest/rails/capybara'
require 'lib/login_helper'

module ActiveSupport
  class TestCase
    include LoginHelper
    fixtures :all
  end
end
