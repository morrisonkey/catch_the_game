class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find_by_id(params[:id])
    @todays_broadcasts = Broadcast.todays_broadcasts
    @todays_date = @todays_broadcasts[0].date_and_year
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
