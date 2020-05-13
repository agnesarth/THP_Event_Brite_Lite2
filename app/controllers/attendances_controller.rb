class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,  :destroy]

  def new
    @event = Event.find(params[:id])
  end


  def create
    #@event = Event.find(params[:id])
    # Create new attendance
    @attendance = Attendance.new(guest_id: params[:guest_id], event_id: params[:event_id], stripe_customer_id: params[:customer_id])
     if @attendance.save
       flash[:success] = "You are now attending this event !"
       redirect_to root_path
     else
       flash[:error] = "You failed"
       redirect_to root_path
     end

  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
  	redirect_to root_path
  end
  
end