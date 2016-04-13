class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :resource_type
      t.text :resource_value

      t.timestamps
    end
    add_index :resources, [:resource_type]
  end
end
