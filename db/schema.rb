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

ActiveRecord::Schema.define(version: 2021_02_03_110949) do

  create_table "image_albums", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_id"
    t.decimal "score", precision: 5, scale: 3
  end

  create_table "post_images", force: :cascade do |t|
    t.integer "image_album_id", null: false
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_album_id"], name: "index_post_images_on_image_album_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
