require 'rails_helper'

feature 'authenticated user deletes product they added' do

  # User Story
  # As an authenticated user
  # I want to delete an item
  # So that no one can review it
  #
  # Acceptance Criteria
  # Visit the product page as user that owns resource
  # View link to delete the product
  # Product deletes and takes me back to index

  xscenario 'authenticated user views delete link on product page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    wine = FactoryGirl.create(:product, user_id: user.id)
    visit root_path
    click_link wine.name

    expect(page).to have_content("Delete Wine")
  end

  xscenario 'authenticated user deletes product from website' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    wine = FactoryGirl.create(:product, user_id: user.id)
    visit root_path
    click_link wine.name
    click_link 'Delete Wine'

    expect(page).to have_content("Wine List")
  end
end
