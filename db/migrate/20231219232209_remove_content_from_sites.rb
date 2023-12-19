class RemoveContentFromSites < ActiveRecord::Migration[7.1]
  def change
    remove_column :sites, :content
  end
end
