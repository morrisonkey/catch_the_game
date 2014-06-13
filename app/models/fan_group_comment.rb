class FanGroupComment < ActiveRecord::Base
  belongs_to :fan
  belongs_to :group
end
