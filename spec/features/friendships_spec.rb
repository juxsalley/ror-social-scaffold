require 'rails_helper'

RSpec.feature "Friendships", type: :feature do
  fixtures :friendships
  fixtures :users 


  feature "Send invite" do
    scenario "send an invite" do 
      login_as(users(:iddrisu))
      visit '/users'
      click_on 'Invite to friendship', match: :first
      expect(page).to have_content("request sent")
      expect(current_path).to eq('/users')
    end
  end
  context "user can accept or reject a request" do 
    scenario "accept request" do 
      login_as(users(:iddrisu))
      visit '/friendships'
      click_on 'Accept'
      expect(page).to have_content("request accepted")
    end

  end
end
