class DeleteUrlFieldFromShortUrls < ActiveRecord::Migration[5.1]
  def change
    remove_column :short_urls, :url
  end
end
