class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :likeable, :polymorphic => true
      t.references :liker, :polymorphic => true

      t.timestamps
    end

    add_index :likes, [:likeable_id, :likeable_type]
    add_index :likes, [:liker_id, :liker_type]
  end
end
