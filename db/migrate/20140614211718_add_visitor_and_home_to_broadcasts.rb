class AddVisitorAndHomeToBroadcasts < ActiveRecord::Migration
  def change
    add_column :broadcasts, :visitor, :string
    add_column :broadcasts, :home, :string
  end
end
