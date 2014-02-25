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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140225133440) do

  create_table "actors", :force => true do |t|
    t.string   "name"
    t.integer  "price"
    t.text     "description"
    t.boolean  "is_published", :default => true
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "avatar_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "phone"
    t.string   "name"
    t.text     "comment"
    t.integer  "actor_id"
    t.date     "event_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "orders", ["actor_id"], :name => "index_orders_on_actor_id"

  create_table "photos", :force => true do |t|
    t.string   "image"
    t.integer  "actor_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "photos", ["actor_id"], :name => "index_photos_on_actor_id"

  create_table "queries", :force => true do |t|
    t.string   "phone"
    t.string   "name"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "videos", :force => true do |t|
    t.integer  "actor_id"
    t.string   "video_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "videos", ["actor_id"], :name => "index_videos_on_actor_id"

end
