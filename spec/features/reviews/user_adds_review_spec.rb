require 'rails_helper'

feature 'authenticted user adds a review to a product page' do

  # User Story
  # As an authenticated user
  # I want to write a review for a wine I have tried
  #
  # Acceptance Criteria
  # View product page and see a link that says leave a review below the product
  # Click link and see a form to fill out and submit button to submit review
  # Review is posted under the product for everyone to see

  scenario 'authenticated user sees add a review link on product page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    wine = FactoryGirl.create(:product)
    visit root_path
    click_link wine.name

    expect(page).to have_content("Add Review")
  end

  scenario 'authenticated user fills out form and submits review to product page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    wine = FactoryGirl.create(:product)
    visit root_path
    click_link wine.name
    click_link "Add Review"

    fill_in 'Title', with: "Criminally good!"
    fill_in 'Body', with: "This wine tastes so good, wonder Chema started a winery. Too bad he's in jail now."
    click_button 'Add Review'
    save_and_open_page

    expect(page).to have_content("Review saved successfully.")
    expect(page).to have_content("Criminally good!")
  end

  xscenario 'authenticated user does not fill out form properly and recieves and error' do

  end
end
