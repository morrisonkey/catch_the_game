class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :facebook_info
      t.string :password_digest
      t.text :bio
      t.string :yelp_link
      t.string :foursquare_link
      t.string :photo_url
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone_number
      t.references :likeable, polymorphic: true

      t.timestamps
    end
  end
end
