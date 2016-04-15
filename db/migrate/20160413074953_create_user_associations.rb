class CreateUserAssociations < ActiveRecord::Migration
  def change
    create_table :user_associations do |t|
      t.integer :user_id, :null => false
      t.string :object_type, :null => false
      t.integer :object_id, :null => false
      t.integer :association_type, :null => false

      t.timestamps
    end
    add_index :user_associations, [:user_id], name: "a_1"
      
    add_index :user_associations, [:object_type, :object_id, :association_type], name: "a_2"
  end
end
