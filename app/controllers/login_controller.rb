class LoginController < ApplicationController
    skip_before_filter :authentication_required

    def index
        @user = User.new
    end
end
