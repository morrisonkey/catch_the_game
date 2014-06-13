class GroupBroadcastComment < ActiveRecord::Base
  belongs_to :group
  belongs_to :broadcast
end
