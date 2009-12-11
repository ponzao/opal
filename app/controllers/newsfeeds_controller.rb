class NewsfeedsController < ApplicationController
    def index
        @newsfeed = Newsfeed.find_latest(15)
    end

    def update
        newsfeed = Newsfeed.find(params[:id])
        Newsfeed.create_liking(current_user, newsfeed)
        flash[:notice] = "You just liked something!"
        redirect_to newsfeeds_url
    end
end
