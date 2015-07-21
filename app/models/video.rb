class Video < ActiveRecord::Base
  attr_accessor :filename_file_name

  belongs_to :user

  has_attached_file :filename, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :filename, :content_type => /\Aimage\/.*\Z/  
end
