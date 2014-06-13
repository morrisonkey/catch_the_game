class Comment < ActiveRecord::Base

  # relationship
  belongs_to :commentable, polymorphic: true, touch: true
  belongs_to :commenter, polymorphic: true, touch: true

  # validations
  validates_presence_of :commentable_id
  validates_presence_of :commenter_id
  
end
