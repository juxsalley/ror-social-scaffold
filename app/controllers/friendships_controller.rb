class FriendshipsController < ApplicationController 


    def index 
        @allfriends = current_user.friends.all
        @friend_request = current_user.received_requests.all
    end
    def create 
        @user = User.find_by(id: params[:receiver_id])
        to_send = current_user.sent_friend_request.build(receiver_id: @user.id, confirmed: false)
        if to_send.save! 
            redirect_to users_path, notice: 'request sent'
        else
            redirect_to users_path, alert: "can't send request at the moment"
        end
    end
    def update 
    end
    def destroy  
    end

end