# This migration comes from maglev_saas (originally 20251130224309)
class MaglevExtendSectionsContentStores < ActiveRecord::Migration[6.1]
  include Maglev::Migration
  def change
    change_table :maglev_sections_content_stores do |t|
      t.references :maglev_site, type: foreign_key_type
    end
    remove_index :maglev_sections_content_stores, %i[container_id container_type published], unique: true, name: 'maglev_sections_content_stores_container_and_published'
    add_index :maglev_sections_content_stores, %i[maglev_site_id container_id container_type published], unique: true, name: 'maglev_pro_sections_content_stores_container_and_published'
  end
end
