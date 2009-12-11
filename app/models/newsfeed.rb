class Newsfeed < ActiveRecord::Base
    has_many :likes
    has_many :liking_users, :through => :likes, :source => :user

    def self.create_liking(user, newsfeed)
        newsfeed.liking_users << user
    end

    def self.user_registered(user)
        create :message => "User #{user.username} registered."
    end

    def self.course_created(course)
        create :message => "Course #{course.name} created."
    end

    def self.exercise_group_joined(reg)
        create :message => "#{reg.user.username} is attending #{reg.exercise_group.course_instance.course.name}, #{reg.exercise_group.course_instance.name} #{reg.exercise_group.course_instance.name}."
    end

    def self.find_latest(n)
        find(:all, :order => "created_at DESC", :limit => n)
    end
end
