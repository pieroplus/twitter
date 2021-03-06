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

ActiveRecord::Schema.define(version: 20180427150258) do

  create_table "follows", force: :cascade do |t|
    t.integer  "followable_id",   limit: 4,                   null: false
    t.string   "followable_type", limit: 255,                 null: false
    t.integer  "follower_id",     limit: 4,                   null: false
    t.string   "follower_type",   limit: 255,                 null: false
    t.boolean  "blocked",                     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.integer  "tweet_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "trends", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "url",        limit: 255
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.text     "text",       limit: 65535
    t.integer  "image_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "retweet_id", limit: 4
    t.integer  "reply_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "tweets", ["image_id"], name: "fk_rails_c4ac7c0255", using: :btree
  add_index "tweets", ["user_id"], name: "fk_rails_003928b7f5", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.text     "name",                   limit: 65535
    t.text     "screen_name",            limit: 65535
    t.string   "icon_image",             limit: 255
    t.string   "header_image",           limit: 255
    t.text     "introduction",           limit: 65535
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "tweets", "images"
  add_foreign_key "tweets", "users"
end
