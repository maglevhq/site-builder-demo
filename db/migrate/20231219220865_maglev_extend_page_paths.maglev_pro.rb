# This migration comes from maglev_pro (originally 20211223210010)
class MaglevExtendPagePaths < ActiveRecord::Migration[6.1]
  include Maglev::Migration
  def change
    change_table :maglev_page_paths do |t|
      t.references :maglev_site, type: foreign_key_type
    end
    add_index :maglev_page_paths, %i[maglev_site_id canonical locale value], unique: true, name: 'site_page_path_uniqueness'
  end
end
