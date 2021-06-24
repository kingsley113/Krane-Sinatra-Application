class CreateJobsitesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :jobsites do |t|
      t.string :name
      t.string :address
      t.string :scheduled_duration
      
      t.date :start_date
      t.date :finish_date

      t.timestamps null: false
    end
  end
end
