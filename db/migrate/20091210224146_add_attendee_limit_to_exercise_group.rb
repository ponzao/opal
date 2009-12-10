class AddAttendeeLimitToExerciseGroup < ActiveRecord::Migration
  def self.up
      add_column :exercise_groups, :attendee_limit, :integer
  end

  def self.down
      remove_column :exercise_groups, :attendee_limit
  end
end
