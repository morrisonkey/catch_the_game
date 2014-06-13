class TeamBroadcast < ActiveRecord::Base
  belongs_to :team
  belongs_to :broadcast
end
