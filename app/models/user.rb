require 'digest'
class User < ActiveRecord::Base
    validates_length_of :username, :in => 3..15
    validates_uniqueness_of :username
    validates_length_of :password, :in => 6..200
    validates_confirmation_of :password
    validates_length_of :email, :in => 5..200, :allow_nil => true, :allow_blank => true # TODO email format validation?
    validates_uniqueness_of :email, :allow_nil => true 
    validates_length_of :student_number, :in => 4..100, :allow_nil => true, :allow_blank => true
    validates_uniqueness_of :student_number, :allow_nil => true

    attr_accessor :password_confirmation

    def before_save
        if self.salt == nil
            self.salt = random_numbers(5)
            self.password = Digest::MD5.hexdigest(self.salt + self.password)
        else
            self.password = Digest::MD5.hexdigest(salt + self.password)
        end
    end

    def password_matches?(password_to_match)
        self.password == Digest::MD5.hexdigest(self.salt + password_to_match)
    end

    private

    def random_numbers(n)
        numbers = ("0".."9").to_a
        newrand = ""
        1.upto(n) { |i| newrand << numbers[rand(numbers.size - 1)] }
        return newrand
    end
end
