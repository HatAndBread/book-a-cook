class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def my_bookings?
    true
  end
  def create?
    user
  end
  def update?
    true
  end
end
