class LendingsController < ApplicationController
    def index
        @books = Book.all
        @lendings = Lending.all
        if true 
        lendingbooks = Book.joins(:lendings).where(lendings: { user_id: session[:user]["id"] }).where("lendings.start_date <= ? AND lendings.end_date >= ?", Date.today, Date.today)
        
        else
        lendingbooks = []
        end
        @orderlendingbooks = lendingbooks.order("Lending.end_date DESC")
    end 
    def create
    end
end
