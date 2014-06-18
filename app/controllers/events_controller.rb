class EventsController < ApplicationController

  protect_from_forgery except: [:update, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @venue = @event.venue
    @broadcast = @event.broadcast
  end

  def create
    broadcast = Broadcast.find_by_id(params[:id])
    event = Event.create({
      name: broadcast.title,
      venue_id: current_user.venues[0].id,
      broadcast_id: params[:id],
      blurb: "1/2 off on beer before half-time"
      })
    redirect_to event_path(event)
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
