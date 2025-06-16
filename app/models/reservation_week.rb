class ReservationWeek < ApplicationRecord
  has_many :reservations, dependent: :destroy

  def week_start
    res_date
  end
end
