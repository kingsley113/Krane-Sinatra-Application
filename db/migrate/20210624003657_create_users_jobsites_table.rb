class CreateUsersJobsitesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :user_sobsites do |t|
      t.integer :user_id
      t.integer :jobsite_id

      t.timestamps null: false
    end
  end
end
