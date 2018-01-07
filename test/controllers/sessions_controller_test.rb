require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "should get Session#new" do
    get login_path
    assert_response :success
    assert_template 'sessions/new'
  end
end
