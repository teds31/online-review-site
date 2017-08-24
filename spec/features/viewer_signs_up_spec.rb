require 'rails_helper'

feature 'sign up' do
  # As a prospective user
  # I want to create an account
  # So that I can post items and review them
  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'First name', with: 'Teddy'
    fill_in 'Last name', with: 'Stanowski'
    fill_in 'Email', with: 'teddy@teddy.com'
    fill_in 'Username', with: 'teddys31'
    fill_in 'Password', with: 'password1'
    fill_in 'Password confirmation', with: 'password1'
    click_button 'Sign up'

    expect(page). to have_content("Sign Out")
  end

  scenario 'does not fill out all information' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'password confirmation does not match' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'Password', with: 'password1'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page). to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end

end
