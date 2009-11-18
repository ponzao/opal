class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  protect_from_forgery # :secret => 'e48fcee2efad21e452f6b72e36922e63'
  
  filter_parameter_logging :password
  
  before_filter :authorize

  def authorize
      if session[:id]
          return true
      else
          flash[:warning] = "Please login to continue."
          redirect_to root_url
          return false
      end
  end
end
