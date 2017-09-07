class Api::V1::VotingController < ApiController

  def create
    review = Review.find(params[:id])
    up_vote = review.increment!(:votes_count)

    render json: up_vote, status: 422
  end

  def destroy
    review = Review.find(params[:id])
    down_vote = review.destroy

    render json: down_vote
  end
end
