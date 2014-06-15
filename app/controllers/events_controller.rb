class EventsController < ApplicationController

  respond_to :json

  def index
    events = Event.all
    respond_with events
  end

  def show
    @event = Event.find_by_id(params[:id])
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
    event = Event.find(params[:id])
    event.update(event_params)
    respond_with event
  end

  def delete
  end

  private

  def event_params
    params.require(:event).permit(:id, :name, :blurb, :info)
  end
end
