class ExerciseGroup < ActiveRecord::Base

    belongs_to :course_instance

    has_many :registrations
    has_many :registered_users, :through => :registrations, :source => :user

    def add_user(user)
        if not self.course_instance.registered?(user) and not group_full?
            self.registered_users << user
        else
            false
        end
    end

    private
    def group_full?
        if self.attendee_limit and 
            self.registered_users.size == self.attendee_limit
            true
        else
            false
        end
    end
end
