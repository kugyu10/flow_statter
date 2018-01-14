class ParticipationsController < ApplicationController

  def create
    @user = current_user
    @plan = params[:id]
    
    @participation = current_user.participation.build()
  end



  private
    def participation_params
      params.require(:participation).permit(:plan_id, user_id, unit_of_number, participatier_name)
    end
end
