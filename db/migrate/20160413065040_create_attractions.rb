class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name, :null => false
      t.text :description

      t.timestamps
    end
  end
end
