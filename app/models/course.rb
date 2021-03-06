class Course < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  acts_as_taggable_on :categories, :ingredients

  INGREDIENTS = ['meat', 'fish', 'pasta', 'vegetarian', 'vegan', 'low fat', 'gluten free', 'lactose free', 'healthy', 'organic', 'comfort food', 'soul food', 'low calorie']
  CATEGORIES = ['italian', 'french', 'chinese', 'japanese', 'mexican', 'german', 'indian']

  validates :title, presence: true
  validates :price, presence: true
end
