class TeamsController < ApplicationController
  def index
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
