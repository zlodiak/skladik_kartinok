class RenameColsInVideo < ActiveRecord::Migration
  def change
    rename_column :videos, :filename_file_size, :video_file_size
    rename_column :videos, :filename_file_name, :video_file_name
    rename_column :videos, :filename_file_format, :video_updated_at     
    rename_column :videos, :filename_content_type, :video_content_type   
    remove_column :videos, :filename    
  end
end
