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
        @user = User.find(session[:user_id])
    end

end
