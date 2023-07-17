class BooksController < ApplicationController
  before_action :move_to_signed_in
  def index
    @books = Book.all
    @reservations = Reservation.all
    @lendings = Lending.all
  end

  def show
    @book = Book.find_by(id: params[:id])
    @lend = Lending.where(book_id: params[:id])
  end

  private
  def move_to_signed_in
    if !current_user 
      redirect_to  '/signin'
    end
  end
end
