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

ActiveRecord::Schema[7.0].define(version: 2022_05_24_213747) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "client_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.integer "client_id"
    t.integer "source_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.boolean "accepts_sms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "client_id"
    t.integer "location_id"
    t.integer "vehicle_id"
    t.integer "source_id"
    t.integer "quantity"
    t.datetime "start_date"
    t.string "job_type"
    t.string "status"
    t.string "address"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "client_id"
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "client_id"
    t.string "name"
    t.string "vin"
    t.string "make"
    t.string "year"
    t.string "vehicle_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
