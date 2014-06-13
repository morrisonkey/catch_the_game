class GroupVenue < ActiveRecord::Base
  belongs_to :group
  belongs_to :venue
end
