class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :reservation_week
  has_one :bunk_assignment, dependent: :destroy
  has_one :assigned_bunk, through: :bunk_assignment, source: :bunk

  validates :sex, presence: true
  validates :res_member_type, presence: true

  def has_bunk_assignment?
    bunk_assignment.present?
  end

  def gender_for_room
    sex&.downcase == 'male' ? 'men' : 'women'
  end
end
