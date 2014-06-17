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

  #create method for a User Liker
  def create
    # binding.pry
    like = Like.create({
      likeable_id: params[:likeable_id],
      likeable_type: params[:likeable_type].classify,
      liker_id: current_user.id,
      liker_type: current_user.class.name
      })
    
    # binding.pry

    render json: like
  end

  def edit

  end

  def update
  end

  def destroy
    # binding.pry
    # like = Like.where("liker_id = ? AND liker_type = ?", current_user.id, current_user.class.name).where("likeable_id = ? AND likeable_id = ?", params[:likeable_id], params[:likeable_type].classify)

    like_id = params[:id]
    Like.destroy(like_id)

    render json: like_id
  end

  # private

  # def likes_params
  #     params.require(:like).permit(:likeable_type)
  # end

end