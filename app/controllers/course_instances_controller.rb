class CourseInstancesController < ApplicationController
    def show
        @ci = CourseInstance.find(params[:id])
    end
end
