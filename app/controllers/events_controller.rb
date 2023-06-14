class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.create(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

    def event_params
      params.require(:event).permit(:name, :date, :location)
    end
end
