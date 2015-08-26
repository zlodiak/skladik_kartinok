class AddTitleToStatusPolls < ActiveRecord::Migration
  def change
    add_column :status_polls, :title, :string
  end
end
