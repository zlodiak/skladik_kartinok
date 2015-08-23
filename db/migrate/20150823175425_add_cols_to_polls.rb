class AddColsToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :is_closed, :boolean, default: nil
    add_column :polls, :owner, :integer
    add_column :polls, :title, :string
    add_column :polls, :description, :text
  end
end
