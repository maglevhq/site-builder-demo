# This migration comes from maglev (originally 20200824085207)
class CreateMaglevSites < ActiveRecord::Migration[6.0]
  include Maglev::Migration
  def change
    create_table :maglev_sites, id: primary_key_type do |t|
      t.string :name
      t.timestamps
    end
  end
end
