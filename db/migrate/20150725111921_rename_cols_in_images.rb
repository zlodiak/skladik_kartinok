class RenameColsInImages < ActiveRecord::Migration
  def change
    rename_column :images, :video_file_size, :image_file_size
    rename_column :images, :video_updated_at, :image_updated_at
    rename_column :images, :video_file_name, :image_file_name
    rename_column :images, :video_content_type, :image_content_type
  end
end
