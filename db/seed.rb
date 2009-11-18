require 'config/environment'

courses = ARGV[0]
delete = ARGV[1]

def seed(n)
    n.times {
        c = Course.create()
        c.name = "course"
        c.description = "description"
        c.save
    }
end

def delete()
    Course.delete_all()
end

def help()
    puts "Usage: ruby seed d w."
    puts "In place of 'd' enter how many courses you want to seed into the db."
    puts "If you wish to wipe the database clean before doing so enter 'w'."
end

unless courses 
    help()
    exit(1)
end

if delete
    delete()
end

seed(courses.to_i)
