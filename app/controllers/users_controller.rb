class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  
  def new
    @user = User.new
  end
  
  private
    #create時のStrong Parameters
    def user_params
      params.require(:user).permit(:nickname, :provider, :uid, :image_url)
    end
  
end
