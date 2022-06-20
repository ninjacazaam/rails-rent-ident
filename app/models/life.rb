class Life < ApplicationRecord
  has_many_attached :photos

  belongs_to :user
end
