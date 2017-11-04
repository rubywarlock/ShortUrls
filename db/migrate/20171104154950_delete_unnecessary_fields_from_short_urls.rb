class DeleteUnnecessaryFieldsFromShortUrls < ActiveRecord::Migration[5.1]
  def change

    change_table :short_urls do |t|
      t.remove :user_type
      t.remove :unique_key
      t.remove :use_count
    end

  end
end
