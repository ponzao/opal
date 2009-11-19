class ApplicationController < ActionController::Base
    helper :all # include all helpers, all the time

    protect_from_forgery # :secret => 'e48fcee2efad21e452f6b72e36922e63'

    filter_parameter_logging :password

    include Authentication

    before_filter :authorize

    protected

    def authorize
        if logged_in?
            return true
        else
            flash[:notice] = "Please login to continue."
            redirect_to sessions_url
            return false
        end
    end

end
