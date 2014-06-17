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

end
