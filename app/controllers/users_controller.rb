class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #params[:id]は文字列型であるがfindメソッドが整数に変更する
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # @user = User.new(params[:user]) と
    # @user = User.new(name: "Foo Bar", email: "foo@invalid",
    #              password: "foo", password_confirmation: "bar")
    # と全く同じ
    # なぜこうなるかといえばform_forで生成されるname属性がuser[email]
    # のようになっているから
    if @user.save
      flash[:success] = "Welcome to the Simple but difficult app!"
      #falshはrailsで用意されている変数
      redirect_to @user
      #redirect_to user_url(@user)と同じ意味
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
