class CreateFans < ActiveRecord::Migration
  def change
    create_table :fans do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :facebook_info
      t.text :bio
      t.string :photo_url
      t.references :likeable, polymorphic: true

      t.timestamps
    end
  end
end
