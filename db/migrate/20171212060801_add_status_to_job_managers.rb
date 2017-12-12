class AddStatusToJobManagers < ActiveRecord::Migration[5.1]
  def change
    add_column :job_managers, :status, :string
  end
end
