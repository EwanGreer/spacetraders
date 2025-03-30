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

ActiveRecord::Schema[8.0].define(version: 2025_03_30_221532) do
  create_table "agents", force: :cascade do |t|
    t.string "symbol"
    t.string "faction"
    t.string "agent_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "accountId"
    t.string "headquarters"
    t.integer "credits"
    t.integer "shipcount"
    t.index ["user_id"], name: "index_agents_on_user_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.string "contract_id"
    t.string "faction_symbol"
    t.string "contract_type"
    t.boolean "accepted"
    t.boolean "fulfilled"
    t.datetime "terms_deadline"
    t.datetime "expiration"
    t.datetime "deadline_to_accept"
    t.integer "payment_on_accepted"
    t.integer "payment_on_fulfilled"
    t.text "terms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "create_contracts", force: :cascade do |t|
    t.string "contract_id"
    t.string "faction_symbol"
    t.string "contract_type"
    t.boolean "accepted"
    t.boolean "fulfilled"
    t.datetime "terms_deadline"
    t.datetime "expiration"
    t.datetime "deadline_to_accept"
    t.integer "payment_on_accepted"
    t.integer "payment_on_fulfilled"
    t.text "terms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "create_deliverables", force: :cascade do |t|
    t.integer "contract_id", null: false
    t.string "trade_symbol"
    t.string "destination_symbol"
    t.integer "units_required"
    t.integer "units_fulfilled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_create_deliverables_on_contract_id"
  end

  create_table "deliverables", force: :cascade do |t|
    t.integer "contract_id", null: false
    t.string "trade_symbol"
    t.string "destination_symbol"
    t.integer "units_required"
    t.integer "units_fulfilled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_deliverables_on_contract_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_token"
    t.index ["account_token"], name: "index_users_on_account_token", unique: true
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "agents", "users"
  add_foreign_key "create_deliverables", "contracts"
  add_foreign_key "deliverables", "contracts"
  add_foreign_key "sessions", "users"
end
