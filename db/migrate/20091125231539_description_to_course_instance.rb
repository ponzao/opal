class DescriptionToCourseInstance < ActiveRecord::Migration
  def self.up
      add_column :course_instances, :description, :text
  end

  def self.down
      remove_column :course_instances, :description
  end
end
