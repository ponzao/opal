class Registration < ActiveRecord::Base
    belongs_to :user
    belongs_to :exercise_group

    after_create :update_newsfeed

    private
    def update_newsfeed
        Newsfeed.exercise_group_joined(self)
    end
end
