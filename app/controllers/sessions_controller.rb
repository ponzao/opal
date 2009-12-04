class SessionsController < ApplicationController
    skip_before_filter :authorize,  :only => [:index, :create, :destroy]

    def index
        @user = User.new
    end

    def create
        user = User.find_by_username(params[:user][:username])

        if user and user.password_matches?(params[:user][:password])
            session[:user_id] = user.id
            redirect_to root_url
        else
            flash[:notice] = "Invalid username or password!"
            redirect_to sessions_url
        end

    end

    def destroy
        reset_session
        redirect_to sessions_url
    end
end
