class RemoveUsersFromCourses < ActiveRecord::Migration[6.0]
  def change
    remove_reference :courses, :users, null: false, foreign_key: true
  end
end
