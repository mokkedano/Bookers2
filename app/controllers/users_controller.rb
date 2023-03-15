class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end


  def create
    # @book = Book.new(book_params)
    # @book.user_id = current_user.id
    # @book.save
    #   redirect_to book_path(@book.id)

  end


  # def create
  #   @book = Book.new(book_params)
  #   @book.user_id = current_user.id
  # if @book.save
  #     redirect_to book_path(@book.id)
  #   else
  #     @books = Book.all
  #     render :index
  #   end
    # flash[:notice] = "You have created book successfully."




  def edit
    @user = User.find(params[:id])

  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
