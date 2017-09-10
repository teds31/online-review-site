require 'rails_helper'

feature 'Create permissions for users and capabilties for administrator' do
  # User Story
  # As an administrator,
  # I want to view all the registered users on the site
  #
  # Acceptance Criteria
  # Make myself an administrator
  # make all other users standard permissions for read and write

  scenario 'admin can see dashboard' do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :user)
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Admin Section'

    expect(page).to have_content('Admin Dashboard')
  end

  xscenario 'admin can see all users' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    user2 = FactoryGirl.create(:user_2)

    visit root_path
    click_link 'Admin Section'
    click_lnk 'See All Users'

    expect(page).to have_content(user2.name)
  end

  xscenario 'delete users who break ToC' do

  end

  xscenario 'delete wine products that break ToC' do

  end

  xscenario' delete reviews that break ToC' do

  end
end
