class AddSitesToUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :sites do |t|
      t.references :user
    end
  end
end
