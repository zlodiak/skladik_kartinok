class AddCToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :file_size, :string
    add_column :videos, :file_format, :string
    add_column :videos, :file_name, :string
  end
end
