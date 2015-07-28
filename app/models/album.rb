class Album < ActiveRecord::Base
  validates :title, presence: true, length: { maximum:  50, minimum: 2 }, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum:  200, minimum: 10 }

  belongs_to :user
end
