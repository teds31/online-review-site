class ProductReviewsController < ApplicationController
  before_action :authenticate_user!
  def index
    @wine = Product.find(params[:product_id])
    @reviews = @product.reviews
  end

  def new
    @wine = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @wine = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.wine = @wine

    if @review.save
      flash[:notice] = "Review saved successfully."
      redirect_to product_path(@wine)
    else
      flash[:alert] = "Failed to save review."
      render :new
    end
  end

  private

    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_session_path, notice: "Please Login to view that page!"
      end
    end

    def review_params
      params.require(:review).permit(:body)
    end

end
