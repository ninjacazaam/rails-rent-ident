class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :life

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def start_date_is_today_onwards
    return if start_date.blank?

    if start_date < Date.today
      errors.add(:start_date, "Can't book dates that have already elapsed!")
    end
  end

end
