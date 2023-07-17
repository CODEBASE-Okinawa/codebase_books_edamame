class LendingsController < ApplicationController
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
    Lending.create(lending_params)
    redirect_to books_path
  end

  def lending_params
    params.require(:lending).permit(:start_date, :end_date, :book_id, :user_id)
  end
end
