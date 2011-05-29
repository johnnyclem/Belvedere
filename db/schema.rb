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

ActiveRecord::Schema.define(:version => 20110529170340) do

  create_table "clips", :force => true do |t|
    t.string   "clip_name"
    t.string   "scene"
    t.integer  "running_time"
    t.string   "camera"
    t.string   "notes"
    t.boolean  "archived"
    t.boolean  "streaming"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "clip_file_name"
    t.string   "clip_content_type"
    t.integer  "clip_file_size"
    t.datetime "clip_updated_at"
    t.string   "size"
    t.string   "resolution"
    t.string   "framerate"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.string   "md5source"
    t.string   "md5dest"
    t.string   "md5_match"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "director"
    t.string   "date"
    t.boolean  "editing_proxy"
    t.boolean  "streaming_proxy"
    t.integer  "unique_copies"
    t.boolean  "file_size_verification"
    t.boolean  "md5_verification"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "offline"
    t.string   "proxy_offline"
    t.string   "archived"
    t.string   "size"
    t.string   "file"
  end

  create_table "settings", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
