class AddDefaultFalseToShortUrls < ActiveRecord::Migration[5.1]
  def change
    change_column_default :short_urls, :permanent, false
  end
end
