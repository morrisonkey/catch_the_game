class ChangeMembershipModeltoReplaceFanwithUserOwner < ActiveRecord::Migration
  def change
  	remove_column :memberships, :fan_id
  	add_column :memberships, :user_id, :integer
  end
end
