class FriendsController < ApplicationController
    def update 
        @user = User.find(params[:user_id])
        Friendship.create_friendship(current_user, @user)
        flash[:notice] = 'You just became friends, awwwww, how sweet!'
        redirect_to(user_url(@user))
    end
end
