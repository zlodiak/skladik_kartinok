class Image < ActiveRecord::Base
  validates :image, presence: true

  belongs_to :user
  belongs_to :album
  belongs_to :poll
  has_many :image_likes

  has_attached_file :image, 
                    :styles => { 
                                  :giant => "1000x700>", 
                                  :large => "600x400>", 
                                  :medium => "300x300>", 
                                  :thumb => "200x100>" 
                    }, 
                    :default_url => "no_image.jpeg"
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/  
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]  

  validate :file_size_validation, :if => "image?"  

  def file_size_validation
    errors[:image] << "Размер файла картинки должен быть менее 5MB" if image.size.to_i > 5.megabytes
  end  
end
