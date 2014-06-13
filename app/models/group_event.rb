class GroupEvent < ActiveRecord::Base
  belongs_to :group
  belongs_to :event
end
