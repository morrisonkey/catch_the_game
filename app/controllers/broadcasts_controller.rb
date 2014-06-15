class BroadcastsController < ApplicationController
  
  def index
    #where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
    @todays_broadcasts = Broadcast.todays_broadcasts
    @todays_date = @todays_broadcasts[0].date_and_year
  end

  def show
    @broadcast = Broadcast.find_by_id(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
