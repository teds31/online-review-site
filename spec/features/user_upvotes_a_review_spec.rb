require 'rails_helper'

feature 'authenticted user upvotes or downvotes a review of a product' do
  # User Story
  # As an authenticated user,
  # I want to up vote a review as helpful of a wine product
  # by clicking on the helpful button using AJAX
  #
  # Acceptance Criteria
  # A user can see the upvote or downvote button under a review
  # User can click on upvote or downvote and it shows a counter next to the vote
  # User can either downvote or upvote once, all clicks are final

  xscenario 'authenticated user sees upvote and downvote buttons' do

  end

  xscenario 'authenticated user upvotes on a review and sees that counter go up' do

  end

  xscenario 'authenticated user downvoets a view and sees that counter go up' do

  end

  xscenario 'authenticated user tries to upvote or downvote after a vote and gets an error' do

  end
end
