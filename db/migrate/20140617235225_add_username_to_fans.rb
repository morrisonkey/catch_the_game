class AddUsernameToFans < ActiveRecord::Migration
  def change
    add_column :fans, :username, :string
  end
end
