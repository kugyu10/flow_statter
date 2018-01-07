require 'test_helper'

class EmailUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get email_users_new_url
    assert_response :success
  end

end
