class ProductReview < ApplicationRecord

  belongs_to :user, :product

  validates :title, :body, :user_username, presence: true
end
