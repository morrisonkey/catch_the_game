class FanBroadcast < ActiveRecord::Base
  belongs_to :fan
  belongs_to :broadcast
end
