class Review < ApplicationRecord

  belongs_to :user 
  belongs_to :product

  validates :title, :body, presence: true

end
