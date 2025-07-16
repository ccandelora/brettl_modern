class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :reservation_week

  validates :sex, presence: true
  validates :res_member_type, presence: true
end
