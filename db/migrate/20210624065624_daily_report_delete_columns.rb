class DailyReportDeleteColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :daily_reports, :delays
    remove_column :daily_reports, :correspondence
  end
end
