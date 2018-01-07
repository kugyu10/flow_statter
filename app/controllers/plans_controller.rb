class PlansController < ApplicationController
  
  before_action :logged_in_user, only: [:new, :create, :edit]
  
  def new
    @plan = Plan.new
  end
  
  def edit
    @plan = Plan.find(params[:id])
  end
  
  def show
    @plan = Plan.find(params[:id])
  end
  
  def create
    @user = current_user
    @plan = Plan.new(plan_params)
    if @plan.save
      flash[:success] = "プランが作成されました"
      redirect_to @plan
    else
      render 'new'
    end
  end
  
  private 
  
    def plan_params
      params.require(:plan).permit(:user_id, :title, :content, :status, :event_date )
    end
    
    # ログインしていなかったらログインを要求する
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインが必要です"
        redirect_to login_path
      end
    end
end

