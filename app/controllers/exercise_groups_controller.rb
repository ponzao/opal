class ExerciseGroupsController < ApplicationController
    def show
        @eg = ExerciseGroup.find(params[:id])
    end
end
