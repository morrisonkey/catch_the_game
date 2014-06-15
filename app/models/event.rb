class Event < ActiveRecord::Base
  has_many :likes, as: :likeable
  belongs_to :venue
  belongs_to :broadcast


  #deleted this because it says the same thing as belongs_to :broadcast

  #deleted this because activerecord handles that for us

end
  