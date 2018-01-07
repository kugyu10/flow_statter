module SessionsHelper
  
  # Session#log_in(user) 渡されたuserでログインする
  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  
  def logged_in?
    !current_user.nil?
  end
  
  # 現在ログイン中のユーザーを返す(いない場合はnil)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
