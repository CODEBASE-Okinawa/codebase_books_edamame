module ApplicationHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def admin?
    if current_user.nil?
      false
    else
      current_user.admin
    end
  end

  def move_to_signed_in
    if !logged_in? 
      redirect_to  '/signin'
    elsif !admin? && logged_in?
      redirect_to  '/books'
    end
  end
end
