module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user||= User.find_by(id:session[:user_id])
  #@current_user = @current_user || User.find_by(id: session[:user_id])
  #の短縮系
  #||= を or equalsと呼ぶ
  end

  def logged_in?
    !current_user.nil?
    #userがログインしていればtrue,その他ならfalseを返すようにする
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
