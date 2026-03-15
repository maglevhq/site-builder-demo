# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_03_15_000322) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "maglev_assets", force: :cascade do |t|
    t.integer "byte_size"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename"
    t.integer "height"
    t.bigint "maglev_site_id"
    t.datetime "updated_at", null: false
    t.integer "width"
    t.index ["maglev_site_id"], name: "index_maglev_assets_on_maglev_site_id"
  end

  create_table "maglev_page_paths", force: :cascade do |t|
    t.boolean "canonical", default: true
    t.string "locale", null: false
    t.bigint "maglev_page_id"
    t.bigint "maglev_site_id"
    t.string "value", null: false
    t.index ["canonical", "locale", "value"], name: "canonical_speed"
    t.index ["canonical", "maglev_page_id", "locale"], name: "scoped_canonical_speed"
    t.index ["maglev_page_id"], name: "index_maglev_page_paths_on_maglev_page_id"
    t.index ["maglev_site_id", "canonical", "locale", "value"], name: "site_page_path_uniqueness", unique: true
    t.index ["maglev_site_id"], name: "index_maglev_page_paths_on_maglev_site_id"
  end

  create_table "maglev_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "lock_version"
    t.bigint "maglev_site_id"
    t.jsonb "meta_description_translations", default: {}
    t.jsonb "og_description_translations", default: {}
    t.jsonb "og_image_url_translations", default: {}
    t.jsonb "og_title_translations", default: {}
    t.datetime "published_at", precision: nil
    t.jsonb "published_payload", default: {}
    t.jsonb "sections_translations", default: {}
    t.jsonb "seo_title_translations", default: {}
    t.jsonb "title_translations", default: {}
    t.datetime "updated_at", null: false
    t.boolean "visible", default: true
    t.index ["maglev_site_id"], name: "index_maglev_pages_on_maglev_site_id"
  end

  create_table "maglev_sections_content_stores", force: :cascade do |t|
    t.string "container_id"
    t.string "container_type"
    t.datetime "created_at", null: false
    t.bigint "maglev_site_id"
    t.boolean "published", default: false
    t.jsonb "sections_translations", default: {}
    t.datetime "updated_at", null: false
    t.index ["maglev_site_id", "container_id", "container_type", "published"], name: "maglev_pro_sections_content_stores_container_and_published", unique: true
    t.index ["maglev_site_id"], name: "index_maglev_sections_content_stores_on_maglev_site_id"
  end

  create_table "maglev_sites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "domain"
    t.string "handle"
    t.jsonb "locales", default: []
    t.integer "lock_version"
    t.string "name"
    t.datetime "published_at", precision: nil
    t.jsonb "sections_translations", default: {}
    t.bigint "siteable_id"
    t.string "siteable_type"
    t.jsonb "style", default: []
    t.string "theme_id"
    t.datetime "updated_at", null: false
    t.index ["siteable_type", "siteable_id"], name: "index_maglev_sites_on_siteable"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "data"
    t.string "session_id", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "sites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "domain"
    t.string "name"
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["domain"], name: "index_sites_on_domain", unique: true
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "password_confirmation"
    t.string "password_digest"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
