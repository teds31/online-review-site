require 'rails_helper'

feature 'authenticated user views wine details when clicking on wine' do
  # User Story
  # As an authenticated user
  # I want to view a list of items
  # So that I can pick items to review
  #
  # Acceptance Criteria
  # views home page
  # clicks on wine name
  # gets taken to wine details to views

  scenario 'views wine name in root page' do
    wine = FactoryGirl.create(:product)
    visit root_path

    expect(page).to have_content(wine.name)
  end

  scenario 'viws wine details page when clicked on name link' do
    wine = FactoryGirl.create(:product)
    visit root_path
    save_and_open_page
    click_link wine.name

    expect(page).to have_content(wine.name)
    expect(page).to have_content(wine.maker)
    expect(page).to have_content(wine.location)
    expect(page).to have_content(wine.year)
  end


end
