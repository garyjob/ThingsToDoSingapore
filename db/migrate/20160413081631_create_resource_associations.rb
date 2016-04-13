class CreateResourceAssociations < ActiveRecord::Migration
  def change
    create_table :resource_associations do |t|
      t.integer :resource_id
      t.string :object_type
      t.integer :object_id

      t.timestamps
    end
    add_index :resource_associations, [:resource_id]
    add_index :resource_associations, [:object_type, :object_id]
  end
end
