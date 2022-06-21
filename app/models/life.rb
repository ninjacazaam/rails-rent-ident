class Life < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings

  validates :title, :price, :bio, presence: true
  validates :rating, :price, numericality: { only_integer: true }
  validates :rating, in: 0..5
end
