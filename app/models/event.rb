class Event < ActiveRecord::Base
  has_many :likes, as: :likeable
  belongs_to :venue
  belongs_to :broadcast


  def is_current_user_the_host?
  	current_user == self.venue.user
  end



end
  