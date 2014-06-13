class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commentable, :polymorphic => true
      t.references :commenter, :polymorphic => true
      t.string :body

      t.timestamps
    end

    add_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, [:commenter_id, :commenter_type]
  end
end
