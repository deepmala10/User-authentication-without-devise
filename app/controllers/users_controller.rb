class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)

    if @user.save
      # User registration successful, log the user in.
      session[:user_id] = @user.id
      redirect_to root_path, notice: "User registered and logged in."
    else
      render 'new'
    end 
  end

  # def index
  #   @users = User.all
  # end

  # def update
  #   @user = User.update(user_params)
  #     if @user.save
  #       redirect_to :@user
  #     else
  #       render :edit
  #     end
  # end

  # def destroy
  #   @user.destroy
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end

  def set_user
    @user = User.find_by(params[:id])
  end
end
