class CreateDailyReportsTable < ActiveRecord::Migration[6.0]
  def change
    create table :daily_reports do |t|
      t.string :work_completed
      t.string :weather
      t.string :deliveries
      t.string :inspections
      t.string :correspondence
      t.string :delays
      
      t.integer :workers_onsite

      t.time :shift_start
      t.time :shift_end

      t.integer :user_id
      t.integer :jobsite_id

      t.timestamps null: false
  end
end
