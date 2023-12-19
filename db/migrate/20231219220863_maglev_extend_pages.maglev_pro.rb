# This migration comes from maglev_pro (originally 20211223205534)
class MaglevExtendPages < ActiveRecord::Migration[6.1]
  include Maglev::Migration
  def change
    change_table :maglev_pages do |t|
      t.references :maglev_site, type: foreign_key_type
    end      
  end
end
