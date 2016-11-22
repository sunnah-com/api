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

ActiveRecord::Schema.define(version: 0) do

  create_table "HadithTable", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "collection",      limit: 50,    null: false
    t.string   "bookID",          limit: 20,    null: false
    t.integer  "babNumber",                     null: false
    t.string   "hadithNumber",    limit: 50,    null: false
    t.integer  "ourHadithNumber",               null: false
    t.integer  "arabicURN",                     null: false
    t.text     "arabicBabName",   limit: 65535
    t.text     "arabicText",      limit: 65535
    t.string   "arabicgrade1",    limit: 2000,  null: false
    t.integer  "englishURN",                    null: false
    t.text     "englishBabName",  limit: 65535
    t.text     "englishText",     limit: 65535
    t.string   "englishgrade1",   limit: 2000,  null: false
    t.datetime "last_updated"
    t.string   "xrefs",           limit: 1000,  null: false
    t.index ["arabicURN"], name: "arabicURN", unique: true, using: :btree
    t.index ["englishURN"], name: "englishURN", unique: true, using: :btree
  end

end
