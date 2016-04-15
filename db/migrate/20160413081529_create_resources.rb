class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name, :null => false
      t.string :resource_type, :null => false
      t.text :resource_value, :null => false

      t.timestamps
    end
    add_index :resources, [:resource_type]
  end
end
