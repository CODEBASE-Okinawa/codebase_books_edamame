class LendingsController < ApplicationController
  before_action :move_to_signed_in
  def index
    nowLendings = Lending.where(user: current_user).where(statuses: true)
    @orderlendingbooks = nowLendings.order("end_date ASC")
  end

  def create
    current_user.lendings.create(lending_params)
    redirect_to book_path(Book.find(lending_params[:book_id]))
  end

  def edit
    @lending_book = Lending.find(params[:id])
  end

  def update
    lending_book = Lending.find(params[:id])
    lending_book.update(lending_params)
    redirect_to lendings_path
  end

  def lending_params
    params.require(:lending).permit(:id, :start_date, :end_date, :book_id, :statuses)
  end

  def move_to_signed_in
    if !current_user 
      redirect_to  '/signin'
    end
  end
end
