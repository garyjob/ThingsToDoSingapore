class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :latitude
      t.integer :longitude
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
