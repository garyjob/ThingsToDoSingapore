class CreateUserActions < ActiveRecord::Migration
  def change
    create_table :user_actions do |t|
      t.integer :user_id
      t.string :object_type
      t.integer :object_id
      t.integer :action_type

      t.timestamps
    end
    add_index :user_actions, [:user_id, :action_type]
    add_index :user_actions, [:object_type, :object_id, :action_type]
  end
end
