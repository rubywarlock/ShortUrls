class CreateShortUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :short_urls do |t|
      t.integer :user_id
      t.text :original_url
      t.string :short_url

      # we can link this to a user for interesting things
      t.string :user_type, limit: 20

      # the real url that we will redirect to
      t.text :url, null: false

      # the unique key
      t.string :unique_key, limit: 10, null: false

      # how many times the link has been clicked
      t.integer :use_count, null: false, default: 0

      # valid until date for expirable urls
      t.datetime :expires_at

      t.timestamps
    end
    # we will lookup the links in the db by key, urls and owners.
    # also make sure the unique keys are actually unique
    add_index :short_urls, :unique_key, unique: true
    add_index :short_urls, :url
    add_index :short_urls, [:user_id, :user_type]
  end
end
