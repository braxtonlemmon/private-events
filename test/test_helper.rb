ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
	fixtures :all
	include ApplicationHelper
	include SessionsHelper

	def is_logged_in?
		!session[:user_id].nil?
	end

	def log_in_as(user)
		session[:user_id] = user.id 
	end
end

class ActionDispatch::IntegrationTest

	# Log in as a particular user.
	def log_in_as(user)
		post login_path, params: { session: { email: user.email } }
	end
end
