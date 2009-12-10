class Friendship < ActiveRecord::Base
    belongs_to :user
    belongs_to :friend, :class_name => 'User', :foreign_key => 'friend_id'

    def self.create_friendship(u1, u2)
        u1.friends << u2
        u2.friends << u1
    end
end
