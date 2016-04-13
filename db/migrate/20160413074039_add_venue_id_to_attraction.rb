class AddVenueIdToAttraction < ActiveRecord::Migration
  def change
    add_column :attractions, :venue_id, :integer
  end
end
