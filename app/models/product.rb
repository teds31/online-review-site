class Product < ApplicationRecord

  belongs_to :user
  has_many :reviews

  validates :name, :maker, :location, :year, presence: true

  # mount_uploader :wine_photo, WinePhotoUploader

  def self.search(search)
    where("name ILIKE ? OR maker ILIKE ? OR location ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end
