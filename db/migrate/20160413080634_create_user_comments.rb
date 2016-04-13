class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.integer :commentor_id
      t.string :object_type
      t.integer :object_id
      t.integer :parent_id
      t.text :description

      t.timestamps
    end
    add_index :user_comments, [:commentor_id]
    add_index :user_comments, [:parent_id]
    add_index :user_comments, [:object_type, :object_id]
  end
end
