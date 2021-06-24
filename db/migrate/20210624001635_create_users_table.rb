class CreateUsersTable < ActiveRecord::Migration[6.0]
  def change
    create table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :position
      t.string :slug

      t.timestamps null: false
    end
  end
end
