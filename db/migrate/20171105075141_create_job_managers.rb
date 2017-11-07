class CreateJobManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :job_managers do |t|
      t.string :name

      t.timestamps
    end
  end
end
