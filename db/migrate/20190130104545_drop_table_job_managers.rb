class DropTableJobManagers < ActiveRecord::Migration[5.1]
  def change
    drop_table :job_managers
  end
end
