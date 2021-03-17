class FriendshipsController < ApplicationController 
    def create 
        @send_friend_request = current_user.friendships.create(friend_id: params[:friend_id])
        if @send_friend_request.save! 
            redirect_to users_path, notice: 'request sent'
        else 
            redirect_to users_path, alert: "can'/t send send request" 
        end

    end

end