class LendingsController < ApplicationController
  def index
    @books = Book.all
    @lendings = Lending.all

    session[:user] = { "id" => 1 } 

    if session[:user] && session[:user]["id"]
      lendingbooks = Book.joins(:lendings).where(lendings: { user_id: session[:user]["id"] }).where("lendings.start_date <= ? AND lendings.end_date >= ?", Date.today, Date.today)
    else
      lendingbooks = []
    end

    @orderlendingbooks = lendingbooks.order("lendings.end_date DESC")
  end

  def create
    Lending.create(lending_params)
    redirect_to books_path
  end

  def lending_params
    params.require(:lending).permit(:start_date, :end_date, :book_id, :user_id)
  end
end
