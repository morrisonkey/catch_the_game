class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    # binding.pry
    @event = Event.find(params[:id])
    @venue = @event.venue
    @broadcast = @event.broadcast
  end

  def new
    @event = Event.find_by_id(params[:id])
    # change this later
  end

  def create
    event = Event.create(event_params)
    respond_with event
  end

  def edit
  end

  def update
    event = Event.find_by_id(params[:id])
    event.update({
      name: params["events"][:name],
      blurb: params["events"][:blurb],
      info: params["events"][:info]
      })
    respond_with event
  end

  def destroy
    event = Event.find_by_id(params[:id])
    event.destroy
    redirect_to '/'
  end

  private

  def event_params
    params.require(:event).permit(:id, :name, :blurb, :info, :venue_id, :broadcast_id)
  end
end
