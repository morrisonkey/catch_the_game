class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :location
      t.string :conference
      t.string :league
      t.string :sport
      t.text :bio
      t.string :photo_url
      t.string :sports_data_id
      t.references :likeable, polymorphic: true

      t.timestamps
    end
  end
end
