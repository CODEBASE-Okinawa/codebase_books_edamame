class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(mail: params[:user][:mail].downcase)
    if @user && @user.authenticate(params[:user][:password])
      log_in @user
      current_user
      if @user.admin
        redirect_to new_admin_book_path
      else
        redirect_to books_path
      end
    else
      flash.now[:alert] = 'メールアドレス、パスワードが正しく入力されていません'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to signin_path
  end

end
