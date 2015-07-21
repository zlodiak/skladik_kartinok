class RenameCToVideoNew < ActiveRecord::Migration
  def change
    rename_column :videos, :file_size, :filename_file_size
    rename_column :videos, :file_name, :filename_file_name
    rename_column :videos, :file_format, :filename_file_format       
    rename_column :videos, :content_type, :filename_content_type     
  end
end
