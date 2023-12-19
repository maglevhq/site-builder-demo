# This migration comes from maglev_pro (originally 20211223210009)
class MaglevExtendAssets < ActiveRecord::Migration[6.1]
  include Maglev::Migration
  def change
    change_table :maglev_assets do |t|
      t.references :maglev_site, type: foreign_key_type
    end      
  end
end
