class SessionsController < ApplicationController
    skip_before_filter :authorize #,  :only => [:index]

    def index
        @user = User.new
    end

    def create
        user = User.find_by_username_and_password(params[:user][:username],
                                                  params[:user][:password])

        if user
            session[:id] = user.id
        end

        redirect_to courses_url
    end

    def destroy
        raise "foo"
        reset_session
        redirect_to root_url
    end
end
