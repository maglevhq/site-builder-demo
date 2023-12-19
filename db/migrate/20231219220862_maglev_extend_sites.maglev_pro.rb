# This migration comes from maglev_pro (originally 20211223201810)
class MaglevExtendSites < ActiveRecord::Migration[6.1]
  include Maglev::Migration
  def change
    change_table :maglev_sites do |t|
      t.references :siteable, type: foreign_key_type, polymorphic: true
      t.string :handle
      t.string :theme_id
      t.string :domain
    end
  end
end
