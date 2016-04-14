class CreateUserAssociations < ActiveRecord::Migration
  def change
    create_table :user_associations do |t|
      t.integer :user_id
      t.string :object_type
      t.integer :object_id
      t.integer :association_type

      t.timestamps
    end
    add_index :user_associations, [:user_id, :association_type], name: "ass_index_1"
    add_index :user_associations, [:object_type, :object_id, :association_type], name: "ass_index_2"
  end
end
