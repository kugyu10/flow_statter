require 'test_helper'

class EmailUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.new(nickname:"test_user", provider:"twitter", uid:"12345678")
    @email_user = EmailUser.new(user_id:1, email: "test11@gmail.com", password: "password", password_confirmation: "password") 
  end
  
  test "vaild email_user" do
    assert @email_user.valid?
  end
  
  test "email addresses should be unique" do
    duplicate_email_user = @email_user.dup
    duplicate_email_user.email = @email_user.email.upcase
    @email_user.save
    assert_not duplicate_email_user.valid?
  end
  
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @email_user.email = mixed_case_email
    @email_user.save
    assert_equal mixed_case_email.downcase, @email_user.reload.email
  end
  
  test "password should be present (nonblank)" do
    @email_user.password = @email_user.password_confirmation = " " * 8
    assert_not @email_user.valid?
  end
  
  test "password should have a minimum length" do
    @email_user.password = @email_user.password_confirmation = "a" * 7
    assert_not @email_user.valid?
  end
end
