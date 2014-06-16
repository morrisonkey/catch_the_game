class TeamsController < ApplicationController
  def index
    @teams = Team.search(params[:search])
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
