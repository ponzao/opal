class CoursesController < ApplicationController
    def index
        @courses = Course.find(:all)

        respond_to do |format|
            format.html # index.html.erb
        end
    end

    def show
        @course = Course.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
        end
    end

    def new
        @course = Course.new

        respond_to do |format|
            format.html # new.html.erb
        end
    end

    def create
        @course = Course.new(params[:course])

        respond_to do |format|
            if @course.save
                flash[:notice] = 'Course was successfully created.'
                format.html { redirect_to(@course) }
            else
                format.html { render :action => "new" }
            end
        end
    end

    def destroy
        @course = Course.find(params[:id])
        @course.destroy
        flash[:notice] = 'Course was deleted!'
        redirect_to courses_url
    end
end
