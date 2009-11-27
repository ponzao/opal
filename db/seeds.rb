# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

overwrite = ENV['overwrite'] == "yes"
how_many_courses = ENV['courses'].to_i

puts "Usage: rake db:seed courses=<number of courses> <overwrite=yes>" if how_many_courses <= 0 && (not overwrite) # to_i returns 0 if ENV['courses'] is empty

Course.delete_all if overwrite

for i in 1..how_many_courses
    c = Course.new(:name => "#{'Course #' + i.to_s}", :description => "Non eram nescius, Brute, cum, quae summis ingeniis exquisitaque doctrina philosophi Graeco serhic noster labor in variahoc displicet philosophari")
    for j in 1..10 
        c.course_instances.build(:name => "#{'CourseInstance #' + j.to_s}", :description => "Non eram nescius, Brute, cum, quae summis ingeniis exquisitaque doctrina philosophi ut hic noster labo, totum hoc displicet philosophari").exercise_groups.build(:time => "12-16", :location => "A111")
    end
    c.save

end
