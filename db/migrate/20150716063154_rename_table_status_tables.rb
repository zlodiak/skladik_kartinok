class RenameTableStatusTables < ActiveRecord::Migration
  def change
    rename_table :status_tables, :status
  end
end
