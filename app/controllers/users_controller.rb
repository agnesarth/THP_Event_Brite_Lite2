class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    if !current_user?(@user.id)
      flash[:error] = "You are the wrong user."
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
    if !current_user?(@user.id)
      flash[:error] = "You are the wrong user."
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if !current_user?(@user.id)
      flash[:error] = "You are the wrong user."
      redirect_to root_path
    else
      if @user.update(user_params)
        flash[:success] = "Your profile has been updated."
        redirect_to user_path(@user.id)
      else
        render 'edit'
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end

end
