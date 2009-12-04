class Newsfeed < ActiveRecord::Base
    def self.user_registered(user)
        create :message => "User #{user.username} registered."
    end

    def self.find_latest(n)
        find(:all, :order => "created_at DESC", :limit => n)
    end
end
