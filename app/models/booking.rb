class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  STATUS = %w[approved pending denied cancelled]

  validates :status, inclusion: { in: STATUS }
  validates :attendees, presence: true
  validates :attendees, numericality: {only_integer: true}
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :address, presence: true
end
