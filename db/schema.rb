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

ActiveRecord::Schema[7.0].define(version: 2024_05_17_103833) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bundles", force: :cascade do |t|
    t.string "name"
    t.string "description", default: ""
    t.string "key"
    t.jsonb "options"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_bundles_on_tenant_id"
  end

  create_table "bundles_items", force: :cascade do |t|
    t.bigint "bundle_id"
    t.bigint "item_id"
    t.index ["bundle_id"], name: "index_bundles_items_on_bundle_id"
    t.index ["item_id"], name: "index_bundles_items_on_item_id"
  end

  create_table "completed_forms", force: :cascade do |t|
    t.bigint "form_id"
    t.jsonb "fields"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_completed_forms_on_form_id"
    t.index ["tenant_id"], name: "index_completed_forms_on_tenant_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.string "code"
    t.boolean "used", default: false
    t.text "note"
    t.integer "category"
    t.integer "reduction"
    t.integer "number"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_discounts_on_code", unique: true
    t.index ["tenant_id"], name: "index_discounts_on_tenant_id"
  end

  create_table "discounts_items", id: false, force: :cascade do |t|
    t.bigint "discount_id"
    t.bigint "item_id"
    t.index ["discount_id"], name: "index_discounts_items_on_discount_id"
    t.index ["item_id"], name: "index_discounts_items_on_item_id"
  end

  create_table "discounts_orders", force: :cascade do |t|
    t.bigint "discount_id"
    t.bigint "order_id"
    t.index ["discount_id"], name: "index_discounts_orders_on_discount_id"
    t.index ["order_id"], name: "index_discounts_orders_on_order_id"
  end

  create_table "forms", force: :cascade do |t|
    t.jsonb "fields"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_forms_on_tenant_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description", default: ""
    t.integer "price"
    t.integer "number"
    t.boolean "active"
    t.datetime "active_from"
    t.datetime "active_until"
    t.integer "limit"
    t.bigint "items_bundle_id"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["items_bundle_id"], name: "index_items_on_items_bundle_id"
    t.index ["tenant_id"], name: "index_items_on_tenant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "amount", default: 0
    t.bigint "order_id"
    t.integer "status", default: 0
    t.bigint "user_id"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_orders_on_order_id", unique: true
    t.index ["tenant_id"], name: "index_orders_on_tenant_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "amount"
    t.integer "refund_amount"
    t.integer "method"
    t.integer "payment_type"
    t.datetime "time"
    t.integer "state"
    t.integer "refund_state"
    t.bigint "payment_id"
    t.bigint "order_id"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
    t.index ["tenant_id"], name: "index_payments_on_tenant_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "gender"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
