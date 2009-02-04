# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081015002258) do

  create_table "activities", :force => true do |t|
    t.boolean  "public"
    t.integer  "item_id"
    t.integer  "person_id"
    t.string   "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["item_id"], :name => "index_activities_on_item_id"
  add_index "activities", ["item_type"], :name => "index_activities_on_item_type"
  add_index "activities", ["person_id"], :name => "index_activities_on_person_id"

  create_table "blogs", :force => true do |t|
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogs", ["person_id"], :name => "index_blogs_on_person_id"

  create_table "comments", :force => true do |t|
    t.integer  "commenter_id"
    t.integer  "commentable_id"
    t.string   "commentable_type", :default => "", :null => false
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commenter_id"], :name => "index_comments_on_commenter_id"
  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"

  create_table "communications", :force => true do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "parent_id"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "sender_deleted_at"
    t.datetime "sender_read_at"
    t.datetime "recipient_deleted_at"
    t.datetime "recipient_read_at"
    t.datetime "replied_at"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "conversation_id"
  end

  add_index "communications", ["type"], :name => "index_communications_on_type"
  add_index "communications", ["sender_id"], :name => "index_communications_on_sender_id"
  add_index "communications", ["recipient_id"], :name => "index_communications_on_recipient_id"
  add_index "communications", ["conversation_id"], :name => "index_communications_on_conversation_id"

  create_table "connections", :force => true do |t|
    t.integer  "person_id"
    t.integer  "contact_id"
    t.integer  "status"
    t.datetime "accepted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "connections", ["person_id", "contact_id"], :name => "index_connections_on_person_id_and_contact_id"

  create_table "conversations", :force => true do |t|
  end

  create_table "email_verifications", :force => true do |t|
    t.integer  "person_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "email_verifications", ["code"], :name => "index_email_verifications_on_code"

  create_table "event_attendees", :force => true do |t|
    t.integer "person_id"
    t.integer "event_id"
  end

  create_table "events", :force => true do |t|
    t.string   "title",                 :default => "", :null => false
    t.string   "description"
    t.integer  "person_id",                             :null => false
    t.datetime "start_time",                            :null => false
    t.datetime "end_time"
    t.boolean  "reminder"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_attendees_count", :default => 0
    t.integer  "privacy",                               :null => false
  end

  create_table "feeds", :force => true do |t|
    t.integer "person_id"
    t.integer "activity_id"
  end

  add_index "feeds", ["person_id", "activity_id"], :name => "index_feeds_on_person_id_and_activity_id"

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "topics_count", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.integer  "person_id"
    t.string   "title"
    t.string   "description"
    t.integer  "photos_count",     :default => 0, :null => false
    t.integer  "primary_photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",                  :null => false
    t.string  "server_url"
    t.string  "salt",       :default => "", :null => false
  end

  create_table "page_views", :force => true do |t|
    t.string   "request_url", :limit => 200
    t.string   "ip_address",  :limit => 16
    t.string   "referer",     :limit => 200
    t.string   "user_agent",  :limit => 200
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  add_index "page_views", ["person_id", "created_at"], :name => "index_page_views_on_person_id_and_created_at"

  create_table "people", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "remember_token"
    t.string   "crypted_password"
    t.text     "description"
    t.datetime "remember_token_expires_at"
    t.datetime "last_contacted_at"
    t.datetime "last_logged_in_at"
    t.integer  "forum_posts_count",          :default => 0,     :null => false
    t.integer  "blog_post_comments_count",   :default => 0,     :null => false
    t.integer  "wall_comments_count",        :default => 0,     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                      :default => false, :null => false
    t.boolean  "deactivated",                :default => false, :null => false
    t.boolean  "connection_notifications",   :default => true
    t.boolean  "message_notifications",      :default => true
    t.boolean  "wall_comment_notifications", :default => true
    t.boolean  "blog_comment_notifications", :default => true
    t.boolean  "email_verified"
    t.integer  "avatar_id"
    t.string   "identity_url"
  end

  add_index "people", ["email"], :name => "index_people_on_email", :unique => true
  add_index "people", ["remember_token"], :name => "index_people_on_remember_token"
  add_index "people", ["admin"], :name => "index_people_on_admin"
  add_index "people", ["deactivated"], :name => "index_people_on_deactivated"

  create_table "photos", :force => true do |t|
    t.integer  "person_id"
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.boolean  "primary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "avatar"
    t.integer  "gallery_id"
    t.string   "title"
    t.integer  "position"
  end

  add_index "photos", ["person_id"], :name => "index_photos_on_person_id"
  add_index "photos", ["parent_id"], :name => "index_photos_on_parent_id"

  create_table "posts", :force => true do |t|
    t.integer  "blog_id"
    t.integer  "topic_id"
    t.integer  "person_id"
    t.string   "title"
    t.text     "body"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["blog_id"], :name => "index_posts_on_blog_id"
  add_index "posts", ["topic_id"], :name => "index_posts_on_topic_id"
  add_index "posts", ["type"], :name => "index_posts_on_type"

  create_table "preferences", :force => true do |t|
    t.string   "domain",              :default => "",    :null => false
    t.string   "smtp_server",         :default => "",    :null => false
    t.boolean  "email_notifications", :default => false, :null => false
    t.boolean  "email_verifications", :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "analytics"
    t.string   "server_name"
    t.string   "app_name"
    t.text     "about"
    t.boolean  "demo",                :default => false
    t.string   "sidebar_title"
    t.text     "sidebar_body"
    t.boolean  "whitelist",           :default => false
  end

  create_table "thumbnails", :force => true do |t|
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "person_id"
    t.string   "name"
    t.integer  "forum_posts_count", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["forum_id"], :name => "index_topics_on_forum_id"

end
