class AttendancesController < ApplicationController

  def create
    @event = Event.find(params[:attendances][:attended_event_id])
    @attendance = current_user.attendances.create(attendance_params)

    if @attendance.save
      redirect_back(fallback_location: root_path)
    else
      flash.now[:notice] = "You were not added to the attendee list"
      render 'events/show', status: :unprocessable_entity
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    redirect_back(fallback_location: root_path)
  end

  private

    def attendance_params
      params.require(:attendances).permit(:attended_event_id)
    end
end
