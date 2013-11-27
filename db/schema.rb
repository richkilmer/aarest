# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131127161254) do

  create_table "accounts", force: true do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["name"], name: "index_accounts_on_name", unique: true

  create_table "grants", force: true do |t|
    t.integer  "group_id",            null: false
    t.integer  "service_id",          null: false
    t.string   "right",               null: false
    t.string   "resource_class"
    t.integer  "resource_identifier"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grants", ["group_id"], name: "index_grants_on_group_id"
  add_index "grants", ["service_id"], name: "index_grants_on_service_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "account_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "group_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "services", force: true do |t|
    t.string   "name",                      null: false
    t.string   "host",                      null: false
    t.boolean  "active",     default: true, null: false
    t.string   "key",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["key"], name: "index_services_on_key"
  add_index "services", ["name"], name: "index_services_on_name", unique: true

  create_table "users", force: true do |t|
    t.integer  "account_id",                     null: false
    t.boolean  "active",          default: true, null: false
    t.string   "email",                          null: false
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
