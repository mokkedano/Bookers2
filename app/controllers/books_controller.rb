class BooksController < ApplicationController
  before_action :is_matchig_login_user_2, only: [:edit, :update, :destroy]



  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end


  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end


  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @user = @books.user
  end


  def edit
    @book = Book.find(params[:id])
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end


  def destroy
    book =Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end





  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


  def is_matchig_login_user_2
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to book_path
    end
  end



end