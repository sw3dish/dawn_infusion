# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_08_031327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "newsletter_items", force: :cascade do |t|
    t.bigint "story_id"
    t.bigint "newsletter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["newsletter_id"], name: "index_newsletter_items_on_newsletter_id"
    t.index ["story_id"], name: "index_newsletter_items_on_story_id"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string "title"
    t.date "publish_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "lyra_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.text "html"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tag"
    t.string "lyra_id"
  end

end
