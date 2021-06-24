class ModifyDailyReportColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :daily_reports, :shift_start, :shift_start_time
    rename_column :daily_reports, :shift_end, :shift_end_time
    rename_column :daily_reports, :workers_onsite, :no_of_workers_onsite

    add_column :daily_reports, :work_date, :string

  end
end
