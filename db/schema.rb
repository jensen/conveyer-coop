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

ActiveRecord::Schema[7.0].define(version: 2022_03_30_041036) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_cuisines_on_slug", unique: true
  end

  create_table "culinary_styles", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.bigint "cuisine_id"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuisine_id"], name: "index_culinary_styles_on_cuisine_id"
    t.index ["restaurant_id"], name: "index_culinary_styles_on_restaurant_id"
  end

  create_table "customizations", force: :cascade do |t|
    t.bigint "menu_item_id", null: false
    t.bigint "modification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_customizations_on_menu_item_id"
    t.index ["modification_id"], name: "index_customizations_on_modification_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "name", null: false
    t.string "extension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.bigint "menu_item_id", null: false
    t.bigint "cart_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["menu_item_id"], name: "index_line_items_on_menu_item_id"
  end

  create_table "menu_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_menu_categories_on_restaurant_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.bigint "menu_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_category_id"], name: "index_menu_items_on_menu_category_id"
  end

  create_table "modification_options", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.boolean "multiple"
    t.bigint "modification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modification_id"], name: "index_modification_options_on_modification_id"
  end

  create_table "modifications", force: :cascade do |t|
    t.string "name"
    t.boolean "required"
    t.integer "max_options"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "delivery"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "address", null: false
    t.string "postal_code", null: false
    t.bigint "city_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_profiles_on_city_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "restaurant_images", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_restaurant_images_on_image_id"
    t.index ["restaurant_id"], name: "index_restaurant_images_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_restaurants_on_slug", unique: true
  end

  create_table "stores", force: :cascade do |t|
    t.string "address"
    t.string "postal_code"
    t.bigint "restaurant_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_stores_on_city_id"
    t.index ["restaurant_id"], name: "index_stores_on_restaurant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "carts", "users"
  add_foreign_key "culinary_styles", "cuisines"
  add_foreign_key "culinary_styles", "restaurants"
  add_foreign_key "customizations", "menu_items"
  add_foreign_key "customizations", "modifications"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "menu_items"
  add_foreign_key "menu_categories", "restaurants"
  add_foreign_key "menu_items", "menu_categories"
  add_foreign_key "modification_options", "modifications"
  add_foreign_key "profiles", "cities"
  add_foreign_key "profiles", "users"
  add_foreign_key "restaurant_images", "images"
  add_foreign_key "restaurant_images", "restaurants"
  add_foreign_key "stores", "cities"
  add_foreign_key "stores", "restaurants"
end
