class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(mail: params[:user][:mail].downcase)
    if @user && @user.authenticate(params[:user][:password])
      if user.admin
        #redirect_to 管理者用のページ
      else
        redirect_to "/books/show"
      end
    else
      flash.now[:alert] = 'メールアドレス、パスワードが正しく入力されていません'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end

end
