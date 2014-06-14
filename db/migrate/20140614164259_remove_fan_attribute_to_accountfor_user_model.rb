class RemoveFanAttributeToAccountforUserModel < ActiveRecord::Migration
  def up
  	# remove_column :table_name, :column_name
  	remove_column :fans, :username
  	remove_column :fans, :email
   	remove_column :fans, :password_digest
  end

  def down
  	# add_column :table_name, :column_name, :type
  	# NOTE!!!!: this did not take on the migration, so I created another migration to add the user_id column
  	add_column :fans, :user_id, :integer	
  end
end
