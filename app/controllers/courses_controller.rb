class CoursesController < ApplicationController
    def index
        @courses = Course.find(:all)
        @time = Time.now
    end

    def show
        @course = Course.find(params[:id])
        @time = Time.now
    end
end
