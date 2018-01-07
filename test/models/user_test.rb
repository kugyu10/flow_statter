require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.new(twitter_id:"testtest", nickname:"testname")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  #test "twitter_id should be present" do
  #  @user.twitter_id = '    '
  #  assert_not @user.valid?
  #end
  
  test "nickname should be present" do
    @user.nickname = '    '
    assert_not @user.valid?
  end
  
end
