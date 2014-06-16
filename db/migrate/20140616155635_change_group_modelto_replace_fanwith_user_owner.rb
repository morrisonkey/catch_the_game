class ChangeGroupModeltoReplaceFanwithUserOwner < ActiveRecord::Migration
  def change
  	remove_column :groups, :fan_id
  	add_column :groups, :user_id, :integer
  end
end
