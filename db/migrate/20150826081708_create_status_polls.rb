class CreateStatusPolls < ActiveRecord::Migration
  def change
    create_table :status_polls do |t|

      t.timestamps null: false
    end
  end
end
