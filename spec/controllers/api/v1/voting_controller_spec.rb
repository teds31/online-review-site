# require  'rails_helper'
#
# RSpec.describe Api::V1::VotingController, type: :controller do
#
#   # other tests ...
#
#   describe "POST /api/v1/votes" do
#     # this test tests the controllers response to the request to create a comment
#     it "creates a upvote counter or adds to it" do
#       # a Comment object is built but not persisted to the database
#       up_vote = build(:up_vote)
#
#       # Rspec allows us to make a request with HTTP verbs (post),
#       # specify a method in the controller to call (:create)
#       # as well as specify params to be made available in the method
#       post :create, params: { up_vote: up_vote.attributes }
#
#       # a response object is created when the test receives a response
#       # assert that the response has a specific HTTP status
#       expect(response).to have_http_status(:created)
#       # assert that the response has a header with a specific value
#       expect(response.header["Location"]).to match /\/api\/v1\/votes/
#     end
#
#   end
# end
