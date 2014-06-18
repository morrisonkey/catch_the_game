class Like < ActiveRecord::Base
    
  # relationship
  belongs_to :likeable, polymorphic: true, touch: true
  belongs_to :liker, polymorphic: true, touch: true

  # validations
  validates_presence_of :likeable_id
  validates_presence_of :liker_id


  def self.user_likes(current_user, likeable_type)
  	self.where(liker_type: current_user.class.name, liker_id: current_user.id, likeable_type: likeable_type)
  end

  # def serializable_hash(options = nil)
  #   {liker_id: liker_id, liker_type: liker_type, likeable_id: likeable_id, likeable_type: likeable_type}
  # end 
  
end
