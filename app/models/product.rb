class Product < ApplicationRecord

  belongs_to :user
  has_many :reviews
  
  validates :name, :maker, :location, :year, presence: true

  # mount_uploader :wine_photo, WinePhotoUploader

end
