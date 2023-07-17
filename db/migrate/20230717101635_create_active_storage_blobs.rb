class CreateActiveStorageBlobs < ActiveRecord::Migration[5.1]
  def change
    create_table :active_storage_blobs
  end
end
