class Life < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :price, :bio, presence: true
  validates :price, numericality: { only_integer: true }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
