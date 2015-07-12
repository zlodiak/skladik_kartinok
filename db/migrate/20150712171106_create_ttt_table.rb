class CreateTttTable < ActiveRecord::Migration
  def change
    create_table :ttt_tables do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
