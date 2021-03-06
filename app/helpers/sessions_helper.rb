module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def remember(user)
    #永続セッションとしてユーザーを記憶する
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end


  def current_user?(user)
    #渡されたユーザーがログイン済みならtrueを返す
    user == current_user
  end

  def current_user
    #記憶トークンcookieに対応するユーザーを返す
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
    #userがログインしていればtrue,その他ならfalseを返すようにする
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
     forget( current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def redirect_back_or (default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
    #request.original_urlによってリクエスト先を取得することができる
    #session変数の:forward_urlキーにリクエストが送られたurlを格納する
  end

end
