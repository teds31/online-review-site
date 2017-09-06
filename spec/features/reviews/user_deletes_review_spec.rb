require 'rails_helper'

feature 'authenticted user deletes own review' do
  # User Story
  # As an authenticated user,
  # I want to delete a review I made on a wine product
  #
  # Accepetance Criteria
  # Visit the product page and see my review that i own
  # Be able to see a delete button on edit product page to delete my review
  # when delete link clicked on I get an alert to confirm
  # refreshes page without my review

  scenario 'authenticated user views edit product page and sees button to delete' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    wine = FactoryGirl.create(:product, user_id: user.id)
    review = FactoryGirl.create(:review, product_id: wine.id, user_id: user.id)
    visit root_path
    click_link wine.name
    click_link 'Edit Review'

    expect(page).to have_content('Delete Review')
  end

  scenario 'authenticated user clicks on delete button and deletes review' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    wine = FactoryGirl.create(:product, user_id: user.id)
    review = FactoryGirl.create(:review, product_id: wine.id, user_id: user.id)
    visit root_path
    click_link wine.name
    click_link 'Edit Review'
    click_link 'Delete Review'

    expect(page).to have_content("Review deleted.")
  end
end
