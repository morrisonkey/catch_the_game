class BroadcastsController < ApplicationController

  def index
    if params[:commit] == "Search"
      @results = Search.team_search(params[:search_parameter])
      if @results.length < 1
        @title = "[ #{params[:search_parameter]} not found ]"
      else
        @title = "[ #{params[:search_parameter]}]"
      end
    else
      @todays_broadcasts = Broadcast.todays_broadcasts
      @todays_date = @todays_broadcasts[0].date_and_year
    end
    #where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
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
