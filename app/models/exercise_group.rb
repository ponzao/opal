class ExerciseGroup < ActiveRecord::Base

    belongs_to :course_instance

    has_many :registrations
    has_many :registered_users, :through => :registrations, :source => :user

    def add_user(user)
        if not self.course_instance.registered?(user)
            self.registered_users << user
            true
        else
            false
        end
    end
end
