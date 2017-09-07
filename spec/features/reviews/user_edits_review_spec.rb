require 'rails_helper'

feature 'authenticted user edits their own review' do

  # User Story
  # As an authenticated user,
  # I want to update a review I made on a wine product
  #
  # Acceptance Criteria
  # If user owns the review resource, they will see an edit review link
  # user then can change the title and the body of the review
  # once they save, they will see the changes reflected
  # all forms must be filled out correctly

  scenario 'authenticated user sees edit link of their own reveiw' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    wine = FactoryGirl.create(:product, user_id: user.id)
    review = FactoryGirl.create(:review, product_id: wine.id, user_id: user.id)
    visit root_path
    click_link wine.name

    expect(page).to have_content("Edit Review")
  end

  scenario 'authenticated user does not see edit link of a review they do not own' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    wine = FactoryGirl.create(:product)
    review = FactoryGirl.create(:review, product_id: wine.id)
    visit root_path
    click_link wine.name

    expect(page).to_not have_content("Edit Review")
  end

  scenario 'authenticated user edits review and submits' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    wine = FactoryGirl.create(:product, user_id: user.id)
    review = FactoryGirl.create(:review, product_id: wine.id, user_id: user.id)
    visit root_path
    click_link wine.name
    click_link 'Edit Review'

    fill_in 'Title', with: "Just as bad as those Trump wines!"
    fill_in 'Body', with: "This wine should be deported to Trump's Tower!"
    click_button 'Save Review'

    expect(page).to have_content("Review saved!")
    expect(page).to have_content("Just as bad as those Trump wines!")
  end

  scenario 'authenticated user gets error if they do not fill out the form correctly' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    wine = FactoryGirl.create(:product, user_id: user.id)
    review = FactoryGirl.create(:review, product_id: wine.id, user_id: user.id)
    visit root_path
    click_link wine.name
    click_link 'Edit Review'

    fill_in 'Title', with: "All talk and no bite"
    click_button 'Save Review'

    expect(page).to have_content("All talk and no bite")
  end

end
