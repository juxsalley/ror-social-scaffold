require 'rails_helper'

RSpec.describe PostsController  do
    fixtures :users
    setup do
        sign_in users(:salley)
        get :index
    end
    describe "Post controller" do
           
    it "create a post sucessfully  " do
        expect(response).to have_http_status(200)
        
    end 
    end
end
