class AddColsToVideos < ActiveRecord::Migration
  def change
    change_table :videos do |t|  
      t.has_attached_file :video     
    end     
  end
end
