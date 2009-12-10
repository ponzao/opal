class AddUserAndCourseIdToCoursesCompletedAndFailed < ActiveRecord::Migration
  def self.up
      add_column :courses_completeds, :user_id, :integer
      add_column :courses_faileds, :user_id, :integer
      add_column :courses_completeds, :course_id, :integer
      add_column :courses_faileds, :course_id, :integer
  end

  def self.down
      remove_column :courses_completeds, :user_id
      remove_column :courses_faileds, :user_id
      remove_column :courses_completeds, :course_id
      remove_column :courses_faileds, :course_id
  end
end
