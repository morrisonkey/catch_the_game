class CreateMembershipTable < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
    	t.integer :fan_id
    	t.integer :group_id

    	t.timestamps


    end
  end
end
