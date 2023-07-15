class BooksController < ApplicationController
  def index
    @book = Book.all
    @reservation = Reservation.all
    @lending = Lending.all
  end 
end
