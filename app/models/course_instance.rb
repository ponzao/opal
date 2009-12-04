class CourseInstance < ActiveRecord::Base
    belongs_to :course
    has_many :exercise_groups, :dependent => :destroy

    def registered_to_course_instance?(user)
        self.exercise_groups.each do |eg|
            if eg.registered_users.include?(user)
                true
            end
        end
        false
    end
end
