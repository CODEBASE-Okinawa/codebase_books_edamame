class Admin::BooksController < ApplicationController  
  def index
    @books = Book.all
    @lendings = Lending.all
  end

  def new
    @book = Book.new
  end

  def create
    title = params[:book][:title]
    image = params[:book][:image]
    image_name = image.original_filename
    image_path = "public/images/#{image_name}"
    
    if image #画像がある場合は画像をpublicに保存、画像名をデータベースに保存
      File.binwrite(image_path, image.read)
      @book = Book.new(
        title: title,
        image_name: image_name
      )
    else #画像がない場合はタイトルのみをデータベースに保存Bool
      @book = Book.new(
        title: title,
      )
    end
    @book.save

    redirect_to action: :index
  end
end