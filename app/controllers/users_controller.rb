# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path, notice: "User created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: "User updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
