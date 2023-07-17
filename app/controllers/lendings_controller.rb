class LendingsController < ApplicationController
  before_action :move_to_signed_in
  def index
    @books = Book.all
    @lendings = Lending.all
    if session[:user_id]
      lendingbooks = Book.joins(:lendings).where(lendings: { user: current_user }).where("lendings.start_date <= ? AND lendings.end_date >= ?", Date.today, Date.today)
    else
      lendingbooks = []
    end
    if !lendingbooks.nil?
      @orderlendingbooks = lendingbooks.order("lendings.end_date ASC")
    end
  end

  def create
    current_user.lendings.create(lending_params)
    redirect_to book_path(Book.find(lending_params[:book_id]))
  end

  def lending_params
    params.require(:lending).permit(:start_date, :end_date, :book_id)
  end
end
