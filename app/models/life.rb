class Life < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :price, :bio, presence: true
  validates :rating, :price, numericality: { only_integer: true }
  validates :rating, inclusion: { in: (0..5) }
end
