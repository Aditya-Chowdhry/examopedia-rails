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

ActiveRecord::Schema.define(version: 20150908150738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "author_name"
    t.string   "author_link"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "tags"
    t.string   "likes"
    t.boolean  "article_review",     default: true
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "article_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "section"
    t.integer  "level"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "exam_date"
    t.datetime "form_release_date"
    t.datetime "form_last_date"
    t.string   "link1_name"
    t.string   "link1"
    t.string   "link2_name"
    t.string   "link2"
    t.string   "link3_name"
    t.string   "link3"
    t.string   "link4_name"
    t.string   "link4"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "exam_review",        default: true
    t.integer  "gen_fees_boys"
    t.integer  "gen_fees_girls"
    t.integer  "sc_fees_boys"
    t.integer  "sc_fees_girls"
    t.string   "others_note"
    t.integer  "others"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "exam_date"
    t.string   "form_date"
    t.string   "last_date"
    t.string   "link1"
    t.string   "link2"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "link1_name"
    t.string   "link2_name"
    t.datetime "result_date"
    t.boolean  "notification_review", default: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "section"
    t.integer  "level"
    t.integer  "points"
    t.boolean  "career_assist"
    t.text     "description"
    t.integer  "age"
    t.string   "courses"
    t.text     "interests"
    t.integer  "marks10"
    t.integer  "marks12"
    t.integer  "marksug"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
