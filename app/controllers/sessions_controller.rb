class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(mail: params[:user][:mail].downcase)
    if @user && @user.authenticate(params[:user][:password])
      log_in @user
      current_user
      if @user.admin
        redirect_to controller: :admin, action: :index
      else
        redirect_to "/books/index"
      end
    else
      flash.now[:alert] = 'メールアドレス、パスワードが正しく入力されていません'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end

end
