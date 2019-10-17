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

ActiveRecord::Schema.define(version: 201909156164408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "clients_classes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "single_class_id"
    t.bigint "registration_id"
    t.index ["registration_id"], name: "index_clients_classes_on_registration_id"
    t.index ["single_class_id"], name: "index_clients_classes_on_single_class_id"
  end

  create_table "cupon_burns", force: :cascade do |t|
    t.bigint "cupon_id"
    t.bigint "registration_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cupon_id"], name: "index_cupon_burns_on_cupon_id"
    t.index ["registration_id"], name: "index_cupon_burns_on_registration_id"
  end

  create_table "cupons", force: :cascade do |t|
    t.bigint "promotion_id"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.bigint "registration_id"
    t.index ["promotion_id"], name: "index_cupons_on_promotion_id"
    t.index ["registration_id"], name: "index_cupons_on_registration_id"
  end

  create_table "pay_methods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "tax"
    t.integer "limit_days"
  end

  create_table "payment_transactions", force: :cascade do |t|
    t.string "code"
    t.float "value"
    t.date "date_payment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "payment_id"
    t.index ["payment_id"], name: "index_payment_transactions_on_payment_id"
    t.index ["user_id"], name: "index_payment_transactions_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "value"
    t.date "dt_venc"
    t.bigint "registration_id"
    t.bigint "pay_method_id"
    t.integer "status", default: 0
    t.index ["pay_method_id"], name: "index_payments_on_pay_method_id"
    t.index ["registration_id"], name: "index_payments_on_registration_id"
  end

  create_table "payments_releases", force: :cascade do |t|
    t.string "name"
    t.float "value"
    t.bigint "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_payments_releases_on_payment_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "value"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "value_percent_discount"
    t.integer "discount_max"
    t.string "cod_promotion"
    t.integer "cupom_number"
    t.string "begin_promotion"
    t.string "end_promotion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "cpf"
    t.bigint "unity_id"
    t.bigint "plan_id"
    t.bigint "pay_method_id"
    t.index ["pay_method_id"], name: "index_registrations_on_pay_method_id"
    t.index ["plan_id"], name: "index_registrations_on_plan_id"
    t.index ["unity_id"], name: "index_registrations_on_unity_id"
  end

  create_table "single_classes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "unit"
    t.date "date"
    t.float "price"
    t.bigint "registration_id"
    t.index ["registration_id"], name: "index_single_classes_on_registration_id"
  end

  create_table "unities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clients_classes", "registrations"
  add_foreign_key "clients_classes", "single_classes"
  add_foreign_key "cupon_burns", "cupons"
  add_foreign_key "cupon_burns", "registrations"
  add_foreign_key "cupons", "promotions"
  add_foreign_key "cupons", "registrations"
  add_foreign_key "payment_transactions", "payments"
  add_foreign_key "payment_transactions", "users"
  add_foreign_key "payments", "pay_methods"
  add_foreign_key "payments", "registrations"
  add_foreign_key "payments_releases", "payments"
  add_foreign_key "registrations", "pay_methods"
  add_foreign_key "registrations", "plans"
  add_foreign_key "registrations", "unities"
  add_foreign_key "single_classes", "registrations"
end
