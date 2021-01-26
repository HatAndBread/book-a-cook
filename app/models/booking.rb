class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :status, presence: true
  validates :attendees, presence: true
  validates :attendees, numericality: {only_integer: true}
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
end
