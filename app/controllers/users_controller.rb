class UsersController < ApplicationController
    skip_before_filter :authorize, :only => [:new, :create]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new params[:user]

        if @user.save
            flash[:notice] = "Account created!"
            redirect_to sessions_url
        else
            render :action => :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(params[:user])
            flash[:notice] = 'User was successfully updated!'
            redirect_to(@user)
        else
            render :action => "edit"
        end
    end
end
