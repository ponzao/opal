class SeparateExamsController < ApplicationController
    def new
        @course = Course.find(params[:course_id])
        @se = @course.separate_exams.build

        respond_to do |format|
            format.html
        end
    end

    def create
        @course = Course.find(params[:course_id])
        @se = @course.separate_exams.build(params[:separate_exam])

        respond_to do |format|
            if @se.save
                flash[:notice] = 'Separate exam was successfully created.'
                format.html { redirect_to(course_url(@course)) }
            else
                format.html { render :action => "new" }
            end
        end
    end

end
