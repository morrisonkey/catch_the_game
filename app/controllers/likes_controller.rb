class LikesController < ApplicationController
  respond_to :json
  
  def index
    binding.pry
    render inline: "hello"
  end

  def show
 
  end

  def new
  end

  def create
    binding.pry
    # Like.create({

    #   })
    render inline: "In Create"
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def likes_params
      params.require(:like).permit(:name)
  end

end