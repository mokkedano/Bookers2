class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
  end
  
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else 
      @books = Book.all
      render :index
    end
    # flash[:notice] = "You have created book successfully."
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end
end


