class FanEvent < ActiveRecord::Base
  belongs_to :fan
  belongs_to :event
end
