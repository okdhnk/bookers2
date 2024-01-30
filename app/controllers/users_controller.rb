class UsersController < ApplicationController

  def show
    puts params[:id]
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(params[:id])
    else
      flash[:notice] = "error"
      render :edit
    end
  end

  def index
    @users = User.all
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
