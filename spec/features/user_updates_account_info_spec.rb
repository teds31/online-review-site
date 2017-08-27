require 'rails_helper'

feature 'authenticated user updates account info' do
  # User Story
  # As an authenticated user
  # I want to update my information
  # So that I can keep my profile up to date
  #
  # Acceptance Criteria
  # Already signed in, I want to click on 'My Account'
  # Which will lead me to my account info for me to update
  # And after updating I will be able to save
  # And if I am missing any information it will not save

  scenario 'visit My Account to update info' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path

    click_link 'My Account'
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Username', with: 'rocksteadyteddy'
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario 'receives and error when inputting an invalid email adress' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path

    click_link 'My Account'
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: 'teddy.com '
    fill_in 'Username', with: 'rocksteadyteddy'
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content("Email is invalid")
  end
end
