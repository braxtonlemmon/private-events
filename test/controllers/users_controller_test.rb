require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:braxton)
	end

  test "should get new" do
    get signup_path
    assert_response :success
  end
end
