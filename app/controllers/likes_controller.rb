class LikesController < ApplicationController
  respond_to :json

  protect_from_forgery except: :create

  
  def index
    binding.pry
    render inline: "hello"
  end

  def show
 
  end

  def new
  end

  def create
    # Like.create({
    #   ikeable_id: 
    #   likeable_type:
    #   liker_id:
    #   liker_type:
    #   })
   

    render json: current_user 
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