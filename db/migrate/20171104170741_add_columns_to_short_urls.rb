class AddColumnsToShortUrls < ActiveRecord::Migration[5.1]
  def change
    change_table :short_urls do |t|
      t.boolean :shared
      t.index :short_url, unique: true
    end
  end
end