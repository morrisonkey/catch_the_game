class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :broadcast
  belongs_to :likeable, polymorphic: true

  has_many :fans, as: :likable
  has_many :groups, as: :likable
  has_many :likes
  #questionable code below
  has_many :teams, through: :like
  has_one :like, through: :broadcast
  has_one :broadcast
  # not so sure about the syntax on the lines above... might not work
end
