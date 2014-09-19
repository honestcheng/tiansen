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

ActiveRecord::Schema.define(:version => 20130328044551) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "categoryable_type"
    t.integer  "position",          :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "categories", ["categoryable_type"], :name => "index_categories_on_categoryable_type"
  add_index "categories", ["company_id"], :name => "index_categories_on_company_id"
  add_index "categories", ["user_id"], :name => "index_categories_on_user_id"

  create_table "companies", :force => true do |t|
    t.string   "name",       :limit => 50
    t.string   "location"
    t.string   "tel"
    t.string   "fax"
    t.string   "email"
    t.string   "linkman"
    t.string   "zipcode"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "tel"
    t.string   "qq"
    t.string   "title"
    t.string   "content"
    t.string   "ip"
    t.string   "ua"
    t.integer  "flag",       :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "feedbacks", ["company_id"], :name => "index_feedbacks_on_company_id"

  create_table "kindeditor_assets", :force => true do |t|
    t.string   "asset"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "news", :force => true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "title"
    t.string   "sub_title"
    t.datetime "published_at"
    t.text     "content"
    t.integer  "position",     :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "news", ["company_id"], :name => "index_news_on_company_id"
  add_index "news", ["user_id"], :name => "index_news_on_user_id"

  create_table "pages", :force => true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "permalink"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pages", ["company_id"], :name => "index_pages_on_company_id"
  add_index "pages", ["user_id"], :name => "index_pages_on_user_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "model"
    t.string   "price"
    t.string   "description"
    t.string   "pic_path"
    t.text     "content"
    t.integer  "position",    :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "products", ["company_id"], :name => "index_products_on_company_id"
  add_index "products", ["user_id"], :name => "index_products_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :limit => 50, :default => "", :null => false
    t.string   "nickname",               :limit => 20, :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "role"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "company_id"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["nickname"], :name => "index_users_on_nickname", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
