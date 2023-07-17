class BooksController < ApplicationController
  def index
    @books = Book.all
    @reservations = Reservation.all
    @lendings = Lending.all
  end

  def show
    # @book = Book.find_by(id: params[:id])
    @book = Book.find_by(id: 1)
    @lendings = Lending.find_by(book_id: params[:id])
    @lend = Lending.all
  end
end
