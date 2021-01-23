class Course < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  has_many :photos

end
