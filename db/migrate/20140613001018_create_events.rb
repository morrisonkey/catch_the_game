class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :info
      t.integer :venue_id
      t.integer :broadcast_id
      t.string :blurb

      t.timestamps
    end
  end
end
