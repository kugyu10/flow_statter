class SessionsController < ApplicationController

  #Emailログイン画面
  def new
  end
  
  #Emailログイン処理
  def create
    email_user = EmailUser.find_by(email: params[:session][:email].downcase)
    if email_user && email_user.authenticate(params[:session][:password])
      user = User.find(email_user.user_id)
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Emailかパスワードが不正です'
      render 'new'
    end
  end

  # Omniauth
  def create_by_omniauth
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    if user.save
      log_in user
      redirect_to user
    else
      log_out
      flash[:danger] = "ログインできませんでした"
      redirect_to root_path
    end
  end
  
  # ログアウト処理
  def destroy
    log_out
    redirect_to root_url
  end
end
