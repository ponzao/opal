class ExerciseGroupsController < ApplicationController
    def show
        @eg = ExerciseGroup.find(params[:id])
    end

    def new
        @course = Course.find(params[:course_id])
        @ci = @course.course_instances.find(params[:course_instance_id])
        @eg = @ci.exercise_groups.build

        respond_to do |format|
            format.html
        end
    end

    def create
        @course = Course.find(params[:course_id])
        @ci = @course.course_instances.find(params[:course_instance_id])
        @eg = @ci.exercise_groups.build(params[:exercise_group])

        respond_to do |format|
            if @eg.save
                flash[:notice] = 'Exercise group was successfully created.'
                format.html { 
                    redirect_to(course_course_instance_url(@course, @ci)) }
            else
                format.html { render :action => "new" }
            end
        end
    end
end
