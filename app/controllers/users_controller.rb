class UsersController < ApplicationController

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params_update
    params.require(:user).permit(:name, :email, :image, :introduction)
  end

end
