class RenameCToVideo < ActiveRecord::Migration
  def change
    rename_column :videos, :filename_file_size, :file_size
    rename_column :videos, :filename_file_name, :file_name
    rename_column :videos, :filename_file_format, :file_format    
    add_column :videos, :content_type, :string
  end
end
