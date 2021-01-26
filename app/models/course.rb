class Course < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  has_many :photos

  validates :title, presence: true
  validates :price, presence: true
end
