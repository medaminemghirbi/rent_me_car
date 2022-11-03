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

ActiveRecord::Schema.define(version: 2022_11_03_153337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.integer "color", null: false
    t.string "body_style", null: false
    t.integer "doors", null: false
    t.integer "seats", null: false
    t.string "engine", null: false
    t.float "price", null: false
    t.string "transmission", null: false
    t.boolean "disponible", null: false
    t.string "emission_class", null: false
    t.bigint "user_id"
    t.bigint "model_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["model_id"], name: "index_cars_on_model_id"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "demanderent", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.integer "status", default: 0, null: false
    t.integer "user_id"
    t.integer "car_id"
    t.index ["car_id"], name: "index_demanderent_on_car_id"
    t.index ["user_id", "car_id"], name: "index_demanderent_on_user_id_and_car_id", unique: true
    t.index ["user_id"], name: "index_demanderent_on_user_id"
  end

  create_table "models", force: :cascade do |t|
    t.string "model_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "lastname", null: false
    t.string "firstname", null: false
    t.string "email", null: false
    t.integer "CIN", null: false
    t.integer "phone", null: false
    t.string "permis_id", null: false
    t.string "password_digest"
    t.integer "age"
    t.date "birthday"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cars", "models"
  add_foreign_key "cars", "users"
end
