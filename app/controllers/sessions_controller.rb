class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # まず送信されたメールアドレスを使ってデータベースからユーザーを取り出している
    if user && user.authenticate(params[:session][:passeord])
      #ユーザーがデータベースにあり、かつ、認証に成功した場合にのみ」となるように設定
      #rubyではnilとfalse以外のすべてのオブジェクトは真偽値でtrueになるがゆえにこれが成り立つx
    #Active Recordが提供するUser.find_byメソッドとhas_secure_passwordが提供するauthenticateメソッドを使っている
    log_in user
    #log_inはsessions_helperで定義したヘルパーメソッド
    params[:session][:remeber_me] == '1' ? remember(user):forget(user)
    redirect_to user
    #redirext_to userをrailsはuser_url(user)と変換する
    else
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
