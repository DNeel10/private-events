class AttendancesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @attendance = Attendance.create(attendance_params)

    if @attendance.save
      redirect_to root_path, :notice => "You are now attending the event!"
    else
      render 'events/show', status: :unprocessable_entity
    end
  end

  private

    def attendance_params
      params.require(:attendances).permit(:event_attendee_id, :attended_event_id)
    end
end
