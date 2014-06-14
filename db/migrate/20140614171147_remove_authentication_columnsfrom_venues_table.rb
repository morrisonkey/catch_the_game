class RemoveAuthenticationColumnsfromVenuesTable < ActiveRecord::Migration
  def change
  	remove_column :venues, :facebook_info
  	remove_column :venues, :password_digest
  end
end
