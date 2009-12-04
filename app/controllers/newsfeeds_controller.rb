class NewsfeedsController < ApplicationController
    def index
        @newsfeed = Newsfeed.find_latest(15)
    end
end
