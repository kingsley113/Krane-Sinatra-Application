class RenameProjectDurationToDescription < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :scheduled_duration, :description
  end
end
