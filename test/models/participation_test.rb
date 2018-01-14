require 'test_helper'

class ParticipationTest < ActiveSupport::TestCase

  def setup
    @planner = users(:kugyu10)
    @user = users(:flow_statter)
    @plan = plans(:one)
    @participation = @user.participations.build(plan_id: @plan.id, participater_name: "てすと参加名", number_of_unit: 1, status: 0)
  end
  
  test "@participationが有効" do
    assert @participation.valid?
  end
  
  test "user_id（参加者ID）は必須" do
    @participation.user_id = nil
    assert_not @participation.valid?
  end
  
  
  test "plan_idは必須" do
    @participation.plan_id = nil
    assert_not @participation.valid?
  end
  
end
