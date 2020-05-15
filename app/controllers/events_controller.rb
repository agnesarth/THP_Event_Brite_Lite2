class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Your event has been created."
      redirect_to event_path(@event.id)
    else
      messages = []
      if @event.errors.any? 
        @event.errors.full_messages.each do |message| 
          messages << message
        end 
        flash[:error] = "You failed, find the following errors :#{messages.join(" ")}"
        render 'new'
      end
    end
  end

  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
    #if !current_user?(@event.admin)
    #  flash[:error] = "You are the wrong user."
    #  redirect_to root_path
    #end
  end

  def update
    @event = Event.find(params[:id])
    #if !current_user?(@event.admin)
    #  flash[:error] = "You are the wrong user."
    #  redirect_to root_path
    #else
      if @event.update(update_event)
        flash[:success] = "Your event has been updated."
        redirect_to event_path(@event.id)
      else
        render 'edit'
      end
    #end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:success] = "Your event was successfully destroyed !"
      redirect_to root_path
    else
      render'destroy'
    end
  end

  private

  def event_params
    params.require(:events).permit(:title, :location, :duration, :description, :price, :start_date, :admin_id, :picture)
  end

  def update_event
    params.require(:event).permit(:title, :location, :duration, :description, :price, :start_date, :admin_id)
  end

end

