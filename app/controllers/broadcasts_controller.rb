class BroadcastsController < ApplicationController

  def index

    # binding.pry
    days_from_now = params[:days_from_now].to_i
    #convert day into integer difference between such day and today
    #pass converted day into daily_games function
    #return daily_games function in json below

    # @broadcasts = Broadcast.todays_broadcasts #where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
    # @todays_date = @broadcasts[0].date_and_year

    # because the broadcast object has complex methods to retrieve data, let's
    # take out the data and put them in simple hashes so that they can be translated to json
    # @json_hash = @broadcasts.map do |broadcast|
    #   {id: broadcast.id, title: broadcast.title, time: broadcast.time, events: broadcast.events}
    # end


    if days_from_now 
      daily_broadcasts = Broadcast.daily_broadcasts(days_from_now) 
    else
      daily_broadcasts = 0  
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: daily_broadcasts}
    end
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
