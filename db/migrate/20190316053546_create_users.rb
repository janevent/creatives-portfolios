class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :artist_name
      t.string :email
      t.string :password_digest 
      t.string :artist_statement
      t.timestamps null: false
    end
  end
end
