class AddPollIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :poll_id, :integer
  end
end
