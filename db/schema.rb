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

ActiveRecord::Schema.define(:version => 20120725090920) do

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "recipe_id"
  end

  create_table "cook_items", :force => true do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.integer  "quantity"
    t.string   "unit"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "category"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.text     "formula"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "vote_count"
    t.integer  "vote_sum"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
