require 'rails_helper'

feature 'authenticated user adds wine items to site' do
  # User Story
  # As an authenticated user
  # I want to add an item
  # So that others can review it
  #
  # Acceptance Criteria
  # Visit add a new item page
  # Be able to fill in details of form to submit
  # Submission would be shown in index/home page

  scenario 'user visits page to add wine' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path

    click_link 'Add A Wine'
    expect(page).to have_content 'Add Your Wine Below'
  end

  scenario 'user adds a wine' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path

    click_link 'Add A Wine'
    fill_in 'Name', with: 'Chema Merlot'
    fill_in 'Maker', with: 'Venegas Vineyard'
    fill_in 'Location', with: 'Napa Valley, CA'
    fill_in 'Year', with: 2012
    click_button 'Add Wine'

    expect(page).to have_content('Wine added!')
    expect(page).to have_content('Chema Merlot')
  end

  scenario ' user does not fill out all information to add wine' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path

    click_link 'Add A Wine'
    fill_in 'Name', with: 'Chema Merlot'
    fill_in 'Year', with: 2012
    click_button 'Add Wine'

    expect(page).to have_content('Error. All forms must be valid. Please edit and try again.')
  end

end
