class Album < ActiveRecord::Base
  validates :title, presence: true, length: { maximum:  50, minimum: 3 }, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum:  600, minimum: 10 }

  belongs_to :user
end
