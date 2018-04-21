require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:kugyu10)
    @email_user = email_users(:kugyu10)
  end
  
  test "homeからのリンクが有効であること" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 1
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    # assert_select "a[href=?]", users_new_path
    assert_select "a[href=?]", '/auth/twitter'
    # assert_select "a[href=?]", setting_path
  end
  
  test "ログイン時はlogout_pathへのリンクが存在すること" do
    log_in_as @user
    get root_path
    assert_select "a[href=?]", logout_path
  end
  
end
