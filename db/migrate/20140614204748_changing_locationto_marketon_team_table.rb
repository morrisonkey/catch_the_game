class ChangingLocationtoMarketonTeamTable < ActiveRecord::Migration
  def change
  	remove_column :teams, :location
  	add_column :teams, :market, :string
  end
end
