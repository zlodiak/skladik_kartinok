class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :video, presence: true

  belongs_to :user

  has_attached_file :video, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
  validates_attachment_content_type :video, :content_type => /\Aimage\/.*\Z/  
  validates_attachment_file_name :video, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]  

 validate :file_size_validation, :if => "video?"  

  def file_size_validation
    errors[:video] << "should be less than 2MB" if video.size.to_i > 1.kilobytes
  end  
end
