class ChangeDefaultValueOfCompletedInTasks < ActiveRecord::Migration
  def up
    change_column_default :tasks, :completed, false
    Task.update_all("completed = 'false'", "completed IS NULL")
    # Task.update_all("completed = false", "completed is NULL ")
  end

  def down
    change_column_default :tasks, :completed, nil
  end
end
