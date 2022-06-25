class Life < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :price, :bio, presence: true
  validates :price, numericality: { only_integer: true }
end
