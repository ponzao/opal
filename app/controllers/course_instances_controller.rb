class CourseInstancesController < ApplicationController
    def show
        @course = Course.find(params[:course_id])
        @ci = @course.course_instances.find(params[:id])
    end

    def new
        @course = Course.find(params[:course_id])
        @ci = @course.course_instances.build

        respond_to do |format|
            format.html
        end
    end

    def create
        @course = Course.find(params[:course_id])
        @ci = @course.course_instances.build(params[:course_instance])

        respond_to do |format|
            if @ci.save
                flash[:notice] = 'Course instance was successfully created.'
                format.html { redirect_to(course_url(@course)) }
            else
                format.html { render :action => "new" }
            end
        end
    end
end
