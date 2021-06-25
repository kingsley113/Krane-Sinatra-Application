class RenameJobsiteToProject < ActiveRecord::Migration[6.0]
  def change
    # Daily Reports Table
    rename_column :daily_reports, :jobsite_id, :project_id

    # Jobsites Table
    rename_table :jobsites, :projects

    # user_Jobsites Table
    rename_table :user_jobsites, :user_projects
    rename_column :user_projects, :jobsite_id, :project_id

    # Users Table - none
  end
end
