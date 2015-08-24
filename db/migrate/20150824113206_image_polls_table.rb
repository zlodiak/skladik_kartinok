 class ImagePollsTable < ActiveRecord::Migration
  def change
    create_table :images_polls, id: false do |t|
      t.integer :image_id
      t.integer :poll_id
    end
  end
end
