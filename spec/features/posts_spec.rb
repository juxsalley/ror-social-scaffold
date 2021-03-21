require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  fixtures :users
  fixtures :posts
  feature 'user should be able to write a post ' do
    scenario 'write a post' do
      login_as(users(:iddrisu))
      visit '/posts'
      within('form#new_post') do
        fill_in 'post_content', with: ''
      end
      find_button('Save').click
      expect(page).to have_http_status(200)
      expect(page).to have_content("Post could not be saved. Content can't be blank")
    end

    scenario 'write a post' do
      login_as(users(:iddrisu))
      visit '/posts'
      fill_in 'post_content',	with: 'another post'
      find_button('Save').click
      expect(page).to have_http_status(200)
      expect(page).to have_content('another post')
    end
  end
end
