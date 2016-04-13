class CreateResourceAssociations < ActiveRecord::Migration
  def change
    create_table :resource_associations do |t|
      t.integer :resource_id
      t.string :object_type
      t.integer :object_id

      t.timestamps
    end
  end
end
