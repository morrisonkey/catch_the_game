class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :creator_id
      t.text :bio
      t.string :photo_url
      t.references :likeable, polymorphic: true

      t.timestamps
    end
  end
end
