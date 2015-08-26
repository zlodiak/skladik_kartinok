class CreateStatusesPollTable < ActiveRecord::Migration
  def change
    create_table :statuses_poll do |t|
      t.string :title
    end
  end
end
