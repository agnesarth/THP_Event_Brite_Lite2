class AdminUsersController < ApplicationController
  before_action :is_superadmin?
  
  def new
    @user = User.new
  end

  # je sais pas si on a besoin d'un create pour le dashboard admin
  def create
    @user = User.new(users_params)
    if @user.save
      flash[:success] = "This profile has been created."
      redirect_to admin_root
    else
      messages = []
      if @event.errors.any? 
        @event.errors.full_messages.each do |message| 
          messages << message
        end 
        flash[:error] = "You failed, find the following errors :#{messages.join(" ")}"
        render 'edit'
    end


  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "This profile has been updated."
        redirect_to admin_root
      else
        messages = []
        if @event.errors.any? 
          @event.errors.full_messages.each do |message| 
            messages << message
          end 
          flash[:error] = "You failed, find the following errors :#{messages.join(" ")}"
          render 'edit'
      end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.delete(user_params)
      flash[:success] = "This profile has been deleted."
      redirect_to admin_root
    else
      messages = []
      if @event.errors.any? 
        @event.errors.full_messages.each do |message| 
          messages << message
        end 
        flash[:error] = "You failed, find the following errors :#{messages.join(" ")}"
        render 'edit'
    end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end

end
