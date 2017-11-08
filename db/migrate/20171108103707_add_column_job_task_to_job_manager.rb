class AddColumnJobTaskToJobManager < ActiveRecord::Migration[5.1]
  def change
    add_column :job_managers, :job_task, :string
  end
end
