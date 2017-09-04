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

  scenario 'authenticated user who owns product resource views delete link on product page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    wine = FactoryGirl.create(:product, user_id: user.id)
    visit root_path
    click_link wine.name

    expect(page).to have_content("Delete Wine")
  end

  scenario 'authenticated user who owns product resource deletes product from website' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    wine = FactoryGirl.create(:product, user_id: user.id)
    visit root_path
    click_link wine.name
    click_link 'Delete Wine'

    expect(page).to have_content("Wine has been removed.")
    expect(page).to have_content("Wine List")
  end

  scenario 'authenticated user who does not own product resource cannot see delete link' do
    user = FactoryGirl.create(:user)
    wine = FactoryGirl.create(:product)
    visit root_path
    click_link wine.name

    expect(page).to_not have_content("Delete Wine")
  end

end