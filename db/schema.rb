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

ActiveRecord::Schema.define(version: 20150425034100) do

  create_table "branches", force: :cascade do |t|
    t.string   "branchname"
    t.string   "coding"
    t.integer  "parent_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.integer  "user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "explain"
    t.integer  "level"
    t.integer  "parent_id"
    t.integer  "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "device_images", force: :cascade do |t|
    t.integer  "device_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "face_file_name"
    t.string   "face_content_type"
    t.integer  "face_file_size"
    t.datetime "face_updated_at"
    t.string   "tag_file_name"
    t.string   "tag_content_type"
    t.integer  "tag_file_size"
    t.datetime "tag_updated_at"
    t.string   "feature_file_name"
    t.string   "feature_content_type"
    t.integer  "feature_file_size"
    t.datetime "feature_updated_at"
    t.string   "inward_file_name"
    t.string   "inward_content_type"
    t.integer  "inward_file_size"
    t.datetime "inward_updated_at"
    t.string   "external_file_name"
    t.string   "external_content_type"
    t.integer  "external_file_size"
    t.datetime "external_updated_at"
    t.string   "other_side_file_name"
    t.string   "other_side_content_type"
    t.integer  "other_side_file_size"
    t.datetime "other_side_updated_at"
    t.string   "agreement_file_name"
    t.string   "agreement_content_type"
    t.integer  "agreement_file_size"
    t.datetime "agreement_updated_at"
    t.string   "receipt_file_name"
    t.string   "receipt_content_type"
    t.integer  "receipt_file_size"
    t.datetime "receipt_updated_at"
  end

  create_table "devices", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "brand"
    t.string   "brand_type"
    t.string   "serial_number"
    t.text     "inward_config"
    t.text     "external_config"
    t.integer  "branch_id"
    t.string   "member"
    t.text     "purpose"
    t.string   "fix"
    t.date     "purchase"
    t.date     "used"
    t.date     "guaranteed"
    t.date     "reject"
    t.integer  "status"
    t.string   "face"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "copy_id"
    t.integer  "group_id"
    t.string   "network_address"
    t.string   "installation_address"
    t.text     "remarks"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "device_id"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "explain"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "branch_id"
    t.integer  "group_id"
    t.integer  "status",                 default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
