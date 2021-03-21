require 'rails_helper'

RSpec.describe FriendshipsController  do
    fixtures :users
    fixtures :friendships
    setup do
        sign_in(users(:iddrisu))
    end
    describe "Create a new friendship " do
        it "make a post request to friendship model and create a new friendship " do 
        expect(response.status).to eq(200)
        post :create, params: { receiver_id: 1 }
        expect(flash[:notice]).to match(/request sent/)
       end
    end
end
