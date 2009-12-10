class Course < ActiveRecord::Base
    validates_length_of :name, :in => 3..255
    validates_length_of :description, :in => 1..255 # TODO how much could this be?

    has_many :course_instances, :dependent => :destroy
    has_many :separate_exams, :dependent => :destroy

    belongs_to :category

    after_create :update_newsfeed

    def self.all
        find(:all, :order => "created_at DESC")
    end

    def update_newsfeed
        Newsfeed.course_created(self)
    end
end
