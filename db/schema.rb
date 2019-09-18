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

ActiveRecord::Schema.define(version: 2019_09_18_144250) do

  create_table "clients_classes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "single_class_id"
    t.integer "registration_id"
    t.index ["registration_id"], name: "index_clients_classes_on_registration_id"
    t.index ["single_class_id"], name: "index_clients_classes_on_single_class_id"
  end

  create_table "cupons", force: :cascade do |t|
    t.integer "promotion_id"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_cupons_on_promotion_id"
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
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_id"
    t.index ["payment_id"], name: "index_payment_transactions_on_payment_id"
    t.index ["user_id"], name: "index_payment_transactions_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "value"
    t.date "dt_venc"
    t.integer "registration_id"
    t.integer "pay_method_id"
    t.integer "status", default: 0
    t.index ["pay_method_id"], name: "index_payments_on_pay_method_id"
    t.index ["registration_id"], name: "index_payments_on_registration_id"
  end

  create_table "payments_releases", force: :cascade do |t|
    t.string "name"
    t.float "value"
    t.integer "payment_id"
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
    t.integer "unity_id"
    t.integer "plan_id"
    t.integer "pay_method_id"
    t.string "email"
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
    t.integer "registration_id"
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

end
