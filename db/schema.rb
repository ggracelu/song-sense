# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_05_28_060227) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "playlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.string "song1"
    t.string "song2"
    t.string "song3"
    t.string "song4"
    t.string "song5"
    t.string "song6"
    t.string "song7"
    t.string "song8"
    t.integer "user_id"
    t.string "color1"
    t.string "color2"
    t.string "color3"
    t.string "color4"
    t.string "color5"
    t.string "scent1"
    t.string "scent2"
    t.string "texture"
    t.integer "likes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "artist1"
    t.string "artist2"
    t.string "artist3"
    t.string "artist4"
    t.string "artist5"
    t.string "artist6"
    t.string "artist7"
    t.string "artist8"
    t.text "generated_input"
    t.text "generated_output"
    t.string "album_art1"
    t.string "album_art2"
    t.string "album_art3"
    t.string "album_art4"
    t.string "album_art5"
    t.string "album_art6"
    t.string "album_art7"
    t.string "album_art8"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "playlists_count"
    t.integer "likes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
