class BooksController < ApplicationController
    def show        
        @book = Book.find(1)
    end
end