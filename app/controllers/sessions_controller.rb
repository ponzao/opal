class SessionsController < ApplicationController
    def create
        session[:id] = true
        redirect_to_root_url
    end

    def destroy
        reset_session
        redirect_to_root_url
    end
end
