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

ActiveRecord::Schema.define(version: 20160709211818) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "sub_title",  limit: 255
    t.text     "readings",   limit: 65535
    t.text     "content",    limit: 65535
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "author_id",  limit: 4
    t.integer  "tag_id",     limit: 4
    t.integer  "book_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "author",     limit: 255
    t.string   "publisher",  limit: 255
    t.string   "image_url",  limit: 255
    t.integer  "article_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "tag_id",     limit: 4
    t.integer  "article_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content",          limit: 65535
    t.string   "commentable_type", limit: 255
    t.integer  "commentable_id",   limit: 4
    t.integer  "author_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "author",      limit: 255
    t.string   "publication", limit: 255
    t.string   "url",         limit: 255
    t.integer  "article_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "username",        limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.boolean  "admin",                       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
