require 'rails_helper'

RSpec.describe LikesController do
    fixtures :users
    setup do
        sign_in(users(:salley))
    end
    describe "Like a post" do
            it "like post sucessfully" do
               expect(response).to have_http_status(:success)  
        end
    end
end
