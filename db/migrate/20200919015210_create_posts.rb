class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :user_id,     null:false
      t.string :title,        null:false
      t.text :appeal,         null:false
      t.string :image_id,     null:false
      t.integer :category_id

      t.timestamps
    end
  end
end
