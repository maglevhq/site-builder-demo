class CreateSites < ActiveRecord::Migration[7.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :domain, index: { unique: true }, null: true
      t.text :content

      t.timestamps
    end
  end
end
