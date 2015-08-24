class Poll < ActiveRecord::Base
  belongs_to :user
  has_many :images

  validates :title, presence: true, length: { maximum:  50, minimum: 3 }, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum:  600, minimum: 100 }  
end
