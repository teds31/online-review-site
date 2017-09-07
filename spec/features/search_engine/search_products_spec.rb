require 'rails_helper'

feature 'user is able to search for wines on site through search engine' do
  # User Story
  # As an un-authenticated user,
  # I want to search wines that are listed on the site
  #
  # Accepetance Criteria
  # I see the search engine bar below the links
  # I type in any type of wine and hit search button
  # Takes me to a new page displaying all the results
  # If I want to run another search, I can use the search bar at the top again
  # I cannot search with a blank query

  scenario 'user is able to view the search engine bar' do
    visit root_path

    find_button 'Search'
  end

  scenario 'user is able to type a search query, submit view results' do
    wine = FactoryGirl.create(:product)
    visit root_path
    fill_in :search, with: 'Montauk Vineyards'
    click_button "Search"

    expect(page).to have_content('Montauk Vineyards')
  end

end
