class Course < ActiveRecord::Base
    validates_length_of :name, :in => 3..255
    validates_length_of :description, :in => 1..255 # TODO how much could this be?

    has_many :course_instances, :dependent => :destroy
    has_many :separate_exams, :dependent => :destroy

    belongs_to :category

    has_many :courses_completeds
    has_many :passed_users, :through => :courses_completeds, :source =>
        :user

    has_many :courses_faileds
    has_many :failed_users, :through => :courses_faileds, :source => :user

    after_create :update_newsfeed

    def self.all
        find(:all, :order => "created_at DESC")
    end

    def update_newsfeed
        Newsfeed.course_created(self)
    end
end
