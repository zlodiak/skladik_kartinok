class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :trackable, 
          :validatable

  belongs_to :status
  has_many :images    #, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :polls, dependent: :destroy
  has_many :image_likes, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

  has_attached_file   :avatar, 
                      :styles => { 
                                    :large => "300x300>", 
                                    :medium => "100x100>", 
                                    :thumb => "30x30>" 
                      }, 
                      :default_url => "no_user_ava_3.png"
                      
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]  
end
