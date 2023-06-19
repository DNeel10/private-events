class AttendancesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @attendance = current_user.attendances.create(attendance_params)

    if @attendance.save
      redirect_back(fallback_location: root_path)
    else
      render 'events/show', flash.now[:notice] = "You were not added to the attendee list"
    end
  end

  private

    def attendance_params
      params.require(:attendances).permit(:attended_event_id)
    end
end
