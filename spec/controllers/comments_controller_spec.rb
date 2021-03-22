require 'rails_helper'

RSpec.describe CommentsController do
  fixtures :users
  describe 'Commenst controller '
  setup do
    sign_in(users(:sallley))
  end
  it 'reponse code should be 200' do
    expect(response).to have_http_status(:success)
  end
end
