class CreateCategoryAssociations < ActiveRecord::Migration
  def change
    create_table :category_associations do |t|
      t.integer :category_id
      t.string :object_type
      t.integer :object_id

      t.timestamps
    end

    add_index :category_associations, [:category_id]
    add_index :category_associations, [:object_type, :object_id]    
  end
end
