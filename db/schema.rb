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

ActiveRecord::Schema[7.1].define(version: 2023_12_20_110357) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenditures", force: :cascade do |t|
    t.bigint "income_expenditure_id"
    t.float "mortgage"
    t.float "utilities"
    t.float "travel"
    t.float "food"
    t.float "loan_repayment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_expenditure_id"], name: "index_expenditures_on_income_expenditure_id"
  end

  create_table "income_expenditures", force: :cascade do |t|
    t.string "person_name"
    t.float "income"
    t.float "expenditure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", force: :cascade do |t|
    t.bigint "income_expenditure_id"
    t.float "salary"
    t.float "other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_expenditure_id"], name: "index_incomes_on_income_expenditure_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "expenditures", "income_expenditures"
  add_foreign_key "incomes", "income_expenditures"
end
