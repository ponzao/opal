class Course < ActiveRecord::Base
    validates_length_of :name, :in => 3..255
    validates_length_of :description, :in => 1..255 # TODO how much could this be?

    has_many :course_instances, :dependent => :destroy

    def self.all
        find(:all, :order => "created_at DESC")
    end
end
