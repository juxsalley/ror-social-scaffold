require 'rails_helper'

RSpec.describe FriendshipsController  do
    fixtures :users
    fixtures :friendships
    setup do
        sign_in(users(:iddrisu))
        sign_in(users(:salley))
        sign_in(users(:aaron))
    end
    describe "Create a new friendship " do
        it "make a post request to friendship model and create a new friendship " do 
        expect(response.status).to eq(200)
        post :create, params: {receiver_id: 1 }
        expect(flash[:notice]).to match(/request sent/)
      
        end

        it "make a post request to friendship model and create a new friendship" do 
        expect(response.status).to eq(200)
        post :create, params: {receiver_id: 3 }
        expect(flash[:notice]).to match(/request sent/)
       
        end

        it "make a post request to friendship model and create a new friendship" do 
        expect(response.status).to eq(200)
        post :create, params: {receiver_id: 2 }
        expect(flash[:notice]).to match(/request sent/)
       
        end
    end
    

end
