class TeamsController < ApplicationController
  def index
    @teams = Team.all
    @baseball_teams = Team.where(sport: "Baseball")
    @mlb_teams = Team.where(league: "MLB")
  end

  def show
    @team = Team.find_by_id(params[:id])
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

  def search
    if params[:search_parameter] != ""
      all_broadcasts = Broadcast.all
      @todays_broadcasts = all_broadcasts.sort_by {|vn| vn[:datetime]}
      search = Search.new
      @results = search.team_search(params[:search_parameter])
      if @results.length < 1
        @title = "No results found for #{params[:search_parameter]}"
      end
    else
      redirect_to(:back)
    end
  end

end
