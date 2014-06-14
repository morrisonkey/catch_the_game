class Event < ActiveRecord::Base
  has_many :likes, as: :likeable
  belongs_to :venue
  belongs_to :broadcast

  #questionable code below
  has_one :broadcast
  # not so sure about the syntax on the lines above... might not work
end
