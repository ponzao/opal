class NewsfeedsController < ApplicationController
    def index
        @newsfeed = Newsfeed.find_latest(15)
        @liked_count = Newsfeed.liked_count
        @other_count = Newsfeed.total_count - @liked_count
    end

    def update
        newsfeed = Newsfeed.find(params[:id])
        Newsfeed.create_liking(current_user, newsfeed)
        flash[:notice] = "You just liked something!"
        redirect_to newsfeeds_url
    end
end
