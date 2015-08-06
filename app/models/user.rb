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

  validates :name, presence: true
  validates :email, presence: true
end
