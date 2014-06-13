class FanVenue < ActiveRecord::Base
  belongs_to :fan
  belongs_to :venue
end
