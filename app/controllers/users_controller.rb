class UsersController < ApplicationController
before_action :authenticate_user!, only: [:index,:show,:create,:edit,:update]



  def show
  	   @book = Book.new
  	   @user = User.find(params[:id])
  end

  def create
      @user = User.find(params[:id])
  end

  def edit
        @user = User.find(params[:id])
     if @user.id != current_user.id
        redirect_to users_path
  end
end

  def update
        @user = User.find(params[:id])
     if @user.update(user_params)
        redirect_to user_path(@user.id)
        flash[:notice] = "Profile was successfully update."
    else
        render :action => "edit"
    end
  end

  def index
        @book = Book.new
        @users = User.all
        @user = current_user
  end


private
  def user_params
      params.require(:user).permit(:username, :introduction, :profile_image)
  end
end