require 'test_helper'

class PlansCreatingTest < ActionDispatch::IntegrationTest
 
  def setup
    @admin = users(:kugyu10)
    @plan = plans(:one)
  end
  
  test '.newは未ログイン時はログインを促す' do
    get new_plan_path
    assert_redirected_to login_path
    follow_redirect!
    assert_template 'sessions/new'
  end
  
  test '.editは未ログイン時はログインを促す' do
    get edit_plan_path(@plan)
    assert_redirected_to login_path
    follow_redirect!
    assert_template 'sessions/new'
  end
  
  test '.createは未ログイン時はログインを促す' do
    post plans_path, params: {plan: {
      content: "test3",
      status: 1,
      event_date: 2018-01-31,
      user_id: 1
    }}
    assert_redirected_to login_path
    follow_redirect!
    assert_template 'sessions/new'
  end
  
  test 'Plan#newを表示する' do
    log_in_as @admin
    assert is_test_user_logged_in?
    get new_plan_path
    assert_template 'plans/new'
  end
  
  test 'Plan.createで新planを作成する' do
    log_in_as @admin
    #画像をつけて新plan作成
    picture = fixture_file_upload('test/fixtures/rails.png', 'image/png')
    assert_difference 'Plan.count', 1 do
      post plans_path, params: {plan: {
        title: "test3event",
        content: "test3",
        status: 1,
        event_date: Date.today,
        user_id: @admin.id,
        front_picture: picture
      }}
    end
    #assert params[:plan].front_picture?
    follow_redirect!
    assert_template 'plans/show'
  end
end
