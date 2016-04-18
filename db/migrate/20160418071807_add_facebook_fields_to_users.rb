class AddFacebookFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :fb_auth_token, :string
    add_column :users, :fb_expires_at, :datetime
    add_column :users, :fb_expires, :boolean
  end
end
