class BroadcastsController < ApplicationController
  
  def index
    @broadcasts = Broadcast.all
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
