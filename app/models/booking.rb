class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :life, dependent: :destroy
end
