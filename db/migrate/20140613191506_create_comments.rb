class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :liker_id
      t.integer :likeable_id
      t.string :body

      t.timestamps
    end
  end
end
