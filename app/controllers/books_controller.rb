class BooksController < ApplicationController
  def index
    @books = Book.all
    @reservations = Reservation.all
    @lendings = Lending.all
  end 
  
    def show
      @book = Book.find(1)
    end

end

