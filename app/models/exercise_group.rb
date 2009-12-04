class ExerciseGroup < ActiveRecord::Base
    belongs_to :course_instance

    has_many :registrations
    has_many :registered_users, :through => :registrations, :source => :user

    after_add_user :update_newsfeed

    def add_user(user)
        if not self.registered_users.include?(user) and
                self.course_instance.registered_to_course_instance?(user)
            self.registered_users << user
            true
        else
            false
        end
    end

    private
    def update_newsfeed
        Newsfeed.exercise_group_joined(self)
    end
end
