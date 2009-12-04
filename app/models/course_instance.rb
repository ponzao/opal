class CourseInstance < ActiveRecord::Base
    belongs_to :course
    has_many :exercise_groups, :dependent => :destroy

    def registered?(user)
        self.exercise_groups.each do |eg|
            if eg.registered_users.include?(user)
                return true
            end
        end
        false
    end
end
