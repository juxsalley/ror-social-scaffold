require 'rails_helper'

RSpec.describe UsersController do
  fixtures :users
  setup do
    sign_in(users(:salley))
  end

  describe 'get user index page' do
    it 'should log user in successfully ' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
