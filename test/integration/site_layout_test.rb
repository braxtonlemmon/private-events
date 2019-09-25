require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:braxton)
	end

	test 'layout links' do
		get root_path
		assert_select 'title', 'Home'
		assert_template 'static_pages/home'
		assert_select 'a[href=?]', root_path, count: 1
		assert_select 'a[href=?]', signup_path, count: 2
		assert_select 'a[href=?]', login_path, count: 1
		get login_path
		assert_select 'title', 'Log in'
		get signup_path
		assert_select 'title', 'Sign up'
	end
end
