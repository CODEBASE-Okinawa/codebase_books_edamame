class Admin::BooksController < ApplicationController  
  def index
  end

  def new
    @book = Book.new
  end

  def create
    title = params[:book][:title]
    image = params[:book][:image]
    image_name = image.original_filename
    image_path = "public/images/#{image_name}"
    
    if image #画像がある場合は画像をpublicに保存、パスをデータベースに保存
      File.binwrite(image_path, image.read)
      @book = Book.new(
        title: title,
        image_path: image_path
      ) 
    end
    @book.save

    redirect_to action: :index
  end
end