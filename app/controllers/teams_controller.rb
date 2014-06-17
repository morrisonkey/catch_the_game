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
    search = Search.new
    @results = search.team_search(params[:search_parameter])
    if @results.length < 1
      @title = "[ #{params[:search_parameter]} not found ]"
    else
      @title = "[ #{params[:search_parameter]}]"
    end
  end

end
