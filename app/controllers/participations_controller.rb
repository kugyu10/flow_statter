class ParticipationsController < ApplicationController

  def create
    @user = current_user
    @plan = Plan.find_by_id(params[:participation][:plan_id])

    @participation = current_user.participations.find_or_initialize_by(plan_id: @plan.id)
    @participation.status = 1 if params[:commit] == "参加する"
    @participation.status = 2 if params[:commit] == "参加しない"
    @participation.save!
    
    #debugger
    redirect_to @plan
  end

  def update
    self.create
  end


  private
    def participation_params
      params.require(:participation).permit(:plan_id, user_id, unit_of_number, participatier_name)
    end
end
