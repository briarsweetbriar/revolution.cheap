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

ActiveRecord::Schema.define(version: 20140602212421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "project_logos", force: true do |t|
    t.string   "file"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_logos", ["project_id"], name: "index_project_logos_on_project_id", using: :btree

  create_table "project_roles", force: true do |t|
    t.string   "title"
    t.string   "name"
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_roles", ["project_id"], name: "index_project_roles_on_project_id", using: :btree
  add_index "project_roles", ["user_id"], name: "index_project_roles_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "website"
    t.string   "source"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["slug"], name: "index_projects_on_slug", using: :btree

  create_table "slideshow_images", force: true do |t|
    t.string   "file"
    t.integer  "slideshow_id"
    t.text     "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slideshow_images", ["slideshow_id"], name: "index_slideshow_images_on_slideshow_id", using: :btree

  create_table "slideshows", force: true do |t|
    t.string   "title"
    t.string   "slideshowable_type"
    t.integer  "slideshowable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slideshows", ["slideshowable_id", "slideshowable_type"], name: "index_slideshows_on_slideshowable_id_and_slideshowable_type", using: :btree

  create_table "taggings", force: true do |t|
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
  add_index "taggings", ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "posts_count",    default: 0, null: false
    t.integer  "projects_count", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["slug"], name: "index_tags_on_slug", unique: true, using: :btree

  create_table "user_avatars", force: true do |t|
    t.string   "file"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "slug"
    t.text     "bio"
    t.text     "github"
    t.text     "website"
    t.string   "email",                default: "", null: false
    t.string   "encrypted_password",   default: "", null: false
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

end
