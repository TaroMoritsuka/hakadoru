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

ActiveRecord::Schema.define(version: 20190518090658) do

  create_table "goods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_goods_on_shop_id", using: :btree
    t.index ["user_id", "shop_id"], name: "index_goods_on_user_id_and_shop_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_goods_on_user_id", using: :btree
  end

  create_table "large_regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "pref_code"
    t.string   "areacode_l"
    t.string   "areaname_l"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medium_regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "pref_code"
    t.string   "areacode_m"
    t.string   "areaname_m"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "pref_code"
    t.string   "pref_name"
    t.string   "area_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "shop_id"
    t.string   "name"
    t.string   "name_kana"
    t.string   "url"
    t.string   "url_mobile"
    t.string   "image_url"
    t.string   "address"
    t.string   "tel"
    t.string   "opentime"
    t.string   "holiday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "small_regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "pref_code"
    t.string   "areacode_s"
    t.string   "areaname_s"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "wants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_wants_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_wants_on_user_id", using: :btree
  end

  add_foreign_key "goods", "shops"
  add_foreign_key "goods", "users"
  add_foreign_key "wants", "shops"
  add_foreign_key "wants", "users"
end
