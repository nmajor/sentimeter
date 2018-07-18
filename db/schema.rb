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

ActiveRecord::Schema.define(version: 2018_07_18_193811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.bigint "category_id"
    t.string "keywords", default: [], array: true
    t.string "homepage_url"
    t.integer "positive_score"
    t.integer "negative_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "reviews_updated_at"
    t.index ["category_id"], name: "index_organizations_on_category_id"
    t.index ["reviews_updated_at"], name: "index_organizations_on_reviews_updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "organization_id"
    t.integer "price"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_products_on_organization_id"
    t.index ["price"], name: "index_products_on_price"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "organization_id"
    t.json "full_sentiment", default: {}
    t.string "sentiment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "remote_id"
    t.text "text"
    t.json "source", default: {}
    t.string "from"
    t.time "remote_created_at"
    t.index ["organization_id"], name: "index_reviews_on_organization_id"
    t.index ["remote_created_at"], name: "index_reviews_on_remote_created_at"
    t.index ["remote_id"], name: "index_reviews_on_remote_id"
    t.index ["sentiment"], name: "index_reviews_on_sentiment"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "organizations", "categories"
  add_foreign_key "products", "organizations"
  add_foreign_key "reviews", "organizations"
end
