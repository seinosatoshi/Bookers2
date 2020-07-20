class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :correct_user, only: [:edit, :update]
  def index
    @book = Book.new
    @users = User.all
  end

  def show
    @new_book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice]="You have created book successfully."
    else
      @books = Book.all
      render "index"
    end
  end

  def new
    
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice]="You have updated user successfully."
    else
      render "edit"
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  # def correct_user
  #   user = User.find(params[:id])
  #   if user != current_user
  #     redirect_to user_path(current_user)
  #   end
  # end
end
