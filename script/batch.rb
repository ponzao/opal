#!/usr/bin/env ruby
require File.join(File.dirname(__FILE__), '../config/environment')

n = ARGV[0].to_i
if n != 0
    (1..n).each do |i| 
        c = Course.new
        c.name = "Course" + i.to_s
        c.description = "Description" + i.to_s + Time.new.to_s
        c.save
    end
end


