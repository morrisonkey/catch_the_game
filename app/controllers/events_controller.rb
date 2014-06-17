class EventsController < ApplicationController

  respond_to :json
  protect_from_forgery :except => [:update, :create]

  def index
    events = Event.all
    respond_with events
  end

  def show
    event = Event.find_by_id(params[:id])
    respond_with event
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

  def delete
  end

  private

  def event_params
    params.require(:event).permit(:id, :name, :blurb, :info)
  end
end
