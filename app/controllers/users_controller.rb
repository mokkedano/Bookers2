class UsersController < ApplicationController
  before_action :is_matchig_login_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]



  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end


  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end





  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


  def is_matchig_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end


  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
