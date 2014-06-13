class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.string :name
      t.string :network
      t.datetime :datetime
      t.text :info
      t.string :blurb

      t.timestamps
    end
  end
end
