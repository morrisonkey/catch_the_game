class RemoveCreatorIdAddFanIdtoGroupsTable < ActiveRecord::Migration
  def change
  	remove_column :groups, :creator_id
  	add_column :groups, :fan_id, :integer
  end
end
