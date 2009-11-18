class User < ActiveRecord::Base
    validates_length_of :username, :in => 3..15
    validates_length_of :password, :in => 6..200
    validates_confirmation_of :password

    attr_accessor :password_confirmation
end
