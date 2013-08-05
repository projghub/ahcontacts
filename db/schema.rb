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

ActiveRecord::Schema.define(:version => 20130805161340) do

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "region"
    t.string   "postal_code"
    t.string   "country"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.string   "fax"
    t.string   "contact_form_url"
    t.datetime "deleted_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "skype"
    t.string   "msn"
    t.string   "aol"
    t.string   "yahoo"
    t.string   "icq"
    t.string   "facebook"
    t.string   "google_plus"
    t.string   "twitter"
  end

  create_table "emails", :force => true do |t|
    t.string   "name"
    t.string   "subject"
    t.string   "from_name",  :default => "Customer Support"
    t.string   "from_email", :default => "support@automationhero.com"
    t.text     "email_text"
    t.text     "email_html"
    t.boolean  "publish",    :default => true
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  create_table "notes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "noteable_id",                     :null => false
    t.string   "noteable_type",                   :null => false
    t.string   "namespace",                       :null => false
    t.text     "description"
    t.boolean  "auto",          :default => true
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "notes", ["user_id"], :name => "index_notes_on_user_id"

  create_table "permissions", :force => true do |t|
    t.string   "namespace",                  :null => false
    t.string   "controller", :default => ""
    t.string   "action",     :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "permissions_users", :force => true do |t|
    t.integer  "permission_id", :null => false
    t.integer  "user_id",       :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "permissions_users", ["permission_id"], :name => "index_permissions_users_on_permission_id"
  add_index "permissions_users", ["user_id"], :name => "index_permissions_users_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "contact_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "taggings", ["contact_id"], :name => "index_taggings_on_contact_id"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
