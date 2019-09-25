require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	test "invalid signup information" do
		get signup_path
		assert_no_difference "User.count" do
			post users_path, params: { user: { name: "",
																				 email: ""} }
		end
		assert_template "users/new"
		assert_select "div#error_explanation"
		assert_select "div.field_with_errors"
		assert_select "form[action='/signup']"
	end

	test "valid signup information" do
		get signup_path
		assert_difference "User.count", 1 do
			post users_path, params: { user: { name: 'Bill',
																				 email: 'bill@example.com' } }
		end
		user = assigns(:user)
		log_in_as(user)
		assert is_logged_in?
	end
end
