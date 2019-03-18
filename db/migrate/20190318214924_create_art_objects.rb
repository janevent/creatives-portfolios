class CreateArtObjects < ActiveRecord::Migration
  def change
    create_table :art_objects do |t|
      t.integer :user_id 
      t.string :title 
      t.string :date 
      t.string :image
      t.string :form 
      t.string :description

      t.timestamps null: false
    end
  end
end
