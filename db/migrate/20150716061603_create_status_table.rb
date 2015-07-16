class CreateStatusTable < ActiveRecord::Migration
  def change
    create_table :status_tables do |t|
      t.string :title, default: 0
    end
  end
end
