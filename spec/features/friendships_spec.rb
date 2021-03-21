require 'rails_helper'

RSpec.feature "Friendships", type: :feature do
fixtures :users 
fixtures :friendships
background do 
  Friendship.create(sender_id: 1, receiver_id: 2, confirmed: false)
  Friendship.create(sender_id: 2, receiver_id: 3, confirmed: false)
end
  feature "Send invite" do
    scenario "send an invite" do 
      login_as(users(:iddrisu))
      visit '/users'
      click_on 'Invite to friendship', match: :first
      expect(page).to have_content("request sent")
      expect(current_path).to eq('/users')
    end
  end


end
