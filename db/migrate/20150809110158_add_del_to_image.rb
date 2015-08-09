class AddDelToImage < ActiveRecord::Migration
  def change
    add_column :images, :is_delete, :boolean, default: nil
  end
end
