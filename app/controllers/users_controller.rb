class UsersController < ApplicationController
    
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render :edit
    else
        redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to user_path(@user.id)
    else
        render :edit
    end
    flash[:notice] = "You have updated user successfully."
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  private
   def list_params
    params.require(:list).permit(:title, :body, :image)
   end

   def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
   end

end
