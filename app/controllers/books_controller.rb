class BooksController < ApplicationController

    # REF:https://railsguides.jp/layouts_and_rendering.html
    def show
        # @book = Book.find_by(id: params[:id])
        # binding.irb
        # if @book.nil?
        #     @books = Book.all
        #     # flash.now[:alert] = "この本は見つかりませんでした"
        #     # render "books/index"
        # end
        
        @book = Book.find(1)
    end
end