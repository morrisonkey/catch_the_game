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

      t.timestamps
    end
  end
end
