class EventsController < ApplicationController

  protect_from_forgery except: [:update, :create]

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
    @event = Event.all.sample
    @venue = @event.venue
    @broadcast = @event.broadcast
  end

  def create
    event = Event.create(event_params)
    respond_with event
  end

  def edit
    @event = Event.find(params[:id])
    @venue = @event.venue
    @broadcast = @event.broadcast
    if @event.venue.user != current_user 
      redirect_to event_path(event)
    end
  end

  def update
    event = Event.find(params[:id])
    event.blurb = params[:blurb]
    event.save
    redirect_to event_path(event)
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
