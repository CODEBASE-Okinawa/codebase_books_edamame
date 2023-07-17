class LendingsController < ApplicationController
  def create
    current_user.lendings.create(lending_params)
    redirect_to book_path(Book.find(lending_params[:book_id]))
  end

  def lending_params
    params.require(:lending).permit(:start_date, :end_date, :book_id)
  end
end
