class Event < ActiveRecord::Base
  has_many :likes, as: :likeable
  belongs_to :venue
  belongs_to :broadcast


  def venue_name
    venue = Venue.where(id: self.venue_id)
    return venue[0].name
  end

end
  