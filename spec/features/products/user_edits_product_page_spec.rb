require 'rails_helper'

feature 'authenticated user edits the wine page' do
  # User Story
  # As an authenticated user
  # I want to update an item's information
  # So that I can correct errors or provide new information
  #
  # Acceptance Criteria
  # As the owner of the product
  # I can view an edit option of the product page
  # And change the info in the fields of the wine and save it

  scenario 'product creator/owner views product page and has edit link available' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    wine = FactoryGirl.create(:product)
    visit root_path
    click_link wine.name

    expect(page).to have_content("Edit Wine")
  end

  scenario 'authenticated user edits form of product info and successfully saves' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    wine = FactoryGirl.create(:product)
    visit root_path
    click_link wine.name
    click_link 'Edit Wine'

    fill_in 'Name', with: 'La Reina del Sur'
    fill_in 'Maker', with: 'Del Castillo Winery'
    fill_in 'Location', with: 'Sinaloa, MX'
    fill_in 'Year', with: 2011
    click_button 'Save Wine'

    expect(page).to have_content("Wine saved!")
    expect(page).to have_content("La Reina del Sur")
  end

  xscenario ' non product creator/owner does not have edit link available' do
    user = FactoryGirl.create(:user)
    wine = FactoryGirl.create(:product)
    visit root_path
    click_link wine.name

    expect(page).to_not have_content("Edit Wine")
    expect(page).to have_content("My Account")
    expect(page).to have_content("Sign Out")
  end

end
