class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :reservation_week
end
