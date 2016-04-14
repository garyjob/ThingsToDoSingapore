# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160413081631) do

  create_table "attractions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_associations", force: true do |t|
    t.integer  "category_id"
    t.string   "object_type"
    t.integer  "object_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_associations", ["category_id"], name: "index_category_associations_on_category_id", using: :btree
  add_index "category_associations", ["object_type", "object_id"], name: "index_category_associations_on_object_type_and_object_id", length: {"object_type"=>191, "object_id"=>nil}, using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "organizer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id"
  end

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", using: :btree

  create_table "resource_associations", force: true do |t|
    t.integer  "resource_id"
    t.string   "object_type"
    t.integer  "object_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resource_associations", ["object_type", "object_id"], name: "index_resource_associations_on_object_type_and_object_id", length: {"object_type"=>191, "object_id"=>nil}, using: :btree
  add_index "resource_associations", ["resource_id"], name: "index_resource_associations_on_resource_id", using: :btree

  create_table "resources", force: true do |t|
    t.string   "name"
    t.string   "resource_type"
    t.text     "resource_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["resource_type"], name: "index_resources_on_resource_type", length: {"resource_type"=>191}, using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", length: {"name"=>191, "resource_type"=>191, "resource_id"=>nil}, using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", length: {"name"=>191}, using: :btree

  create_table "user_associations", force: true do |t|
    t.integer  "user_id"
    t.string   "object_type"
    t.integer  "object_id"
    t.integer  "association_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_associations", ["object_type", "object_id", "association_type"], name: "ass_index_2", length: {"object_type"=>191, "object_id"=>nil, "association_type"=>nil}, using: :btree
  add_index "user_associations", ["user_id", "association_type"], name: "ass_index_1", using: :btree

  create_table "user_comments", force: true do |t|
    t.integer  "commentor_id"
    t.string   "object_type"
    t.integer  "object_id"
    t.integer  "parent_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_comments", ["commentor_id"], name: "index_user_comments_on_commentor_id", using: :btree
  add_index "user_comments", ["object_type", "object_id"], name: "index_user_comments_on_object_type_and_object_id", length: {"object_type"=>191, "object_id"=>nil}, using: :btree
  add_index "user_comments", ["parent_id"], name: "index_user_comments_on_parent_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  limit: 191, default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "venues", force: true do |t|
    t.string   "name"
    t.integer  "latitude"
    t.integer  "longitude"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
