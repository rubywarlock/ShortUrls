class AddPermanentToUrls < ActiveRecord::Migration[5.1]
  def change
    change_table :short_urls do |t|
      t.boolean :permanent
    end
  end
end
