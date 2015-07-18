class Video < ActiveRecord::Base
  has_attached_file :video, :styles => { :medium => "600x300>", :thumb => "200x100>" }
  validates_attachment_content_type :video, :content_type => ["video/mp4"]
  validates_attachment_file_name :video, :matches => [/mp4\Z/]  
end
