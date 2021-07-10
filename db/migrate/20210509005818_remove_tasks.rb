class RemoveTasks < ActiveRecord::Migration[6.0]
  def change
    drop_table :tasks
  end
end
