require 'test_helper'

class EmailLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "ログイン失敗時のflash残留がないこと" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: {email: "", password: ""}}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  
  test "有効なEmailログインのテスト" do
    get login_path
    assert_not is_test_user_logged_in?
    assert_no_difference 'EmailUser.count' do
      post login_path, params: { session: { email: "kugyu10@gmail.com",
                                         password:              "password" }}
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_test_user_logged_in?
  end
end
