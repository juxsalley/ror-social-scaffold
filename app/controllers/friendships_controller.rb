class FriendshipsController < ApplicationController 
    def new 
        @send_friend_request = Friendship.new
    end
    def create 
        @send_friend_request = current_user.friendship.new(friend_id: params[:friend_id], user_id: current_user.id , status: false)
        if @send_friend_request.save! 
            redirect_to users_path, notice: 'request sent'
        else 
            redirect_to users_path, alert: "can'/t send send request" 
        end

    end

end