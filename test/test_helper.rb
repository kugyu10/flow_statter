ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  fixtures :all

  # テストコードのみ使用するlog_in_asメソッド
  def log_in_as(user)
    session[:user_id] = user.id
  end
  
  # 現在ログインしているかを返すメソッド
  def is_test_user_logged_in?
    !session[:user_id].nil?
  end
  
  class ActionDispatch::IntegrationTest
  
    # 結合テスト時のlog_in_asメソッド
    def log_in_as(user)
      
      email_user = EmailUser.find_by(user_id:user.id)
      post login_path, params: {session: {email: email_user.email, password: 'password' }}
    end
  end
end
