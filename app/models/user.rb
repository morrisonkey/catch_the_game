class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :fan
  has_many :venues

  #a user can be a member of many groups
  has_many :groups, through: :memberships
  has_many :memberships

  has_many :likes, as: :liker
  has_many :comments, as: :commenter
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #a user can be a leader of many groups.
  #this method provides the groups associated with a user in a leadership capacity
  def groups_as_leader
  	Group.where(user_id: self.id)
  end
end
