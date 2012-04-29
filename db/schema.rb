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

ActiveRecord::Schema.define(:version => 20120424124716) do

  create_table "addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "line1"
    t.string   "line2"
    t.string   "district"
    t.string   "state"
    t.string   "country"
    t.string   "pin"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "addresses", ["user_id"], :name => "index_addresses_on_user_id"

  create_table "diagnoses", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.date     "diagnosis_date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "diagnoses", ["user_id"], :name => "index_diagnoses_on_user_id"

  create_table "diagnosis_anthropometries", :force => true do |t|
    t.integer  "diagnosis_id"
    t.string   "height"
    t.string   "weight"
    t.string   "bmi"
    t.string   "abdominal_girth"
    t.string   "systoloic_bp"
    t.string   "diastolic_bp_supine"
    t.string   "diastolic_bp_errect"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "diagnosis_anthropometries", ["diagnosis_id"], :name => "index_diagnosis_anthropometries_on_diagnosis_id"

  create_table "diagnosis_blood_tests", :force => true do |t|
    t.integer  "diagnosis_id"
    t.string   "hemoglobin_total"
    t.string   "hemoglobin_differential_count"
    t.string   "esr"
    t.string   "blood_sugar_fasting"
    t.string   "blood_sugar_pp"
    t.string   "hba1c"
    t.string   "triglycerides"
    t.string   "total_cholestrol"
    t.string   "ldl"
    t.string   "hdl"
    t.string   "blood_urea"
    t.string   "serum_uric_acid"
    t.string   "serum_creatinine"
    t.string   "LFT_serum_albumin"
    t.string   "LFT_gloulin_ratio"
    t.string   "LFT_serum_bilirubin"
    t.string   "LFT_SGOT"
    t.string   "LFT_SGPT"
    t.string   "LFT_GGT"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "diagnosis_blood_tests", ["diagnosis_id"], :name => "index_diagnosis_blood_tests_on_diagnosis_id"

  create_table "diagnosis_others", :force => true do |t|
    t.integer  "diagnosis_id"
    t.string   "fundus"
    t.string   "VPT"
    t.string   "ECG"
    t.string   "TMT"
    t.string   "echocardiography_2d"
    t.string   "angiography"
    t.string   "ultrasound"
    t.string   "carotid_doppler"
    t.string   "color_doppler_for_limbs"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "diagnosis_others", ["diagnosis_id"], :name => "index_diagnosis_others_on_diagnosis_id"

  create_table "diagnosis_urines", :force => true do |t|
    t.integer  "diagnosis_id"
    t.string   "urine_pus_cells"
    t.string   "urine_spot_protien"
    t.string   "GFR"
    t.string   "sugar"
    t.string   "ketones"
    t.string   "microalbumin"
    t.string   "alb"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "forem_categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "forem_forums", :force => true do |t|
    t.string  "title"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", :default => 0
  end

  create_table "forem_groups", :force => true do |t|
    t.string "name"
  end

  add_index "forem_groups", ["name"], :name => "index_forem_groups_on_name"

  create_table "forem_memberships", :force => true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], :name => "index_forem_memberships_on_group_id"

  create_table "forem_moderator_groups", :force => true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], :name => "index_forem_moderator_groups_on_forum_id"

  create_table "forem_posts", :force => true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "reply_to_id"
    t.string   "state",       :default => "pending_review"
    t.boolean  "notified",    :default => false
  end

  add_index "forem_posts", ["reply_to_id"], :name => "index_forem_posts_on_reply_to_id"
  add_index "forem_posts", ["state"], :name => "index_forem_posts_on_state"
  add_index "forem_posts", ["topic_id"], :name => "index_forem_posts_on_topic_id"
  add_index "forem_posts", ["user_id"], :name => "index_forem_posts_on_user_id"

  create_table "forem_subscriptions", :force => true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "locked",       :default => false,            :null => false
    t.boolean  "pinned",       :default => false
    t.boolean  "hidden",       :default => false
    t.datetime "last_post_at"
    t.string   "state",        :default => "pending_review"
    t.integer  "views_count",  :default => 0
  end

  add_index "forem_topics", ["forum_id"], :name => "index_forem_topics_on_forum_id"
  add_index "forem_topics", ["state"], :name => "index_forem_topics_on_state"
  add_index "forem_topics", ["user_id"], :name => "index_forem_topics_on_user_id"

  create_table "forem_views", :force => true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             :default => 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], :name => "index_forem_views_on_updated_at"
  add_index "forem_views", ["user_id"], :name => "index_forem_views_on_user_id"
  add_index "forem_views", ["viewable_id"], :name => "index_forem_views_on_topic_id"

  create_table "phones", :force => true do |t|
    t.integer  "user_id"
    t.string   "mobile_number"
    t.string   "office_number"
    t.string   "home_number"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                             :null => false
    t.string   "email",                                            :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token",                                :null => false
    t.string   "perishable_token",   :default => "",               :null => false
    t.integer  "login_count",        :default => 0,                :null => false
    t.integer  "failed_login_count", :default => 0,                :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.date     "date_of_birth"
    t.string   "gender"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.boolean  "forem_admin",        :default => false
    t.string   "forem_state",        :default => "pending_review"
  end

end
