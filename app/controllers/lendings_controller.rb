class LendingsController < ApplicationController
  def create
    Lending.create(lending_params)
    redirect_to books_path
  end

  def lending_params
    params.require(:lending).permit(:start_date, :end_date, :book_id, :user_id)
  end
end
