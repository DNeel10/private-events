class AttendancesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @event = Event.find(params[:attendances][:attended_event_id])
    @attendance = current_user.attendances.create(attendance_params)

    if @attendance.save
      redirect_to @event
    else
      flash.now[:notice] = "You were not added to the attendee list"
      render 'events/show', status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:attendances][:attended_event_id])
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    redirect_to @event
  end

  private

    def attendance_params
      params.require(:attendances).permit(:attended_event_id)
    end
end
