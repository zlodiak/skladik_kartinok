class CreateImageLikes < ActiveRecord::Migration
  def change
    create_table :image_likes do |t|
      t. integer :user_id
      t. integer :image_id

      t.timestamps null: false
    end
  end
end
