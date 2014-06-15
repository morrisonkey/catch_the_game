class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find_by_id(params[:id])
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
