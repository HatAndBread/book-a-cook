class Course < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :title, presence: true
  validates :price, presence: true
end
