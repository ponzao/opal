class Course < ActiveRecord::Base
    validates_length_of :name, :in => 3..255
    validates_length_of :description, :in => 1..255 # TODO how much could this be?

    has_many :course_instances
end
