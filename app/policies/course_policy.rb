class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index?
    true
  end
  def show?
    true
  end

  def my_courses?
    true
  end

  def create?
    user
  end
end
