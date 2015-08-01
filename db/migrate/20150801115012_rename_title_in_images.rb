class RenameTitleInImages < ActiveRecord::Migration
  def change
    remove_column(:images, :title)
    add_column(:images, :description, :text)
  end
end
