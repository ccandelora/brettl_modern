class BunkAssignment < ApplicationRecord
  belongs_to :reservation_week
  belongs_to :reservation
  belongs_to :bunk

  validates :reservation_week_id, uniqueness: { scope: :bunk_id, message: "Bunk already assigned for this week" }
  validates :reservation_id, uniqueness: { scope: :reservation_week_id, message: "Reservation already has a bunk assignment for this week" }

  # Ensure gender compatibility
  validate :gender_compatibility

  scope :for_week, ->(week) { where(reservation_week: week) }

  delegate :room, to: :bunk
  delegate :user, to: :reservation
  delegate :name, to: :reservation, prefix: true
  delegate :sex, to: :reservation

  private

  def gender_compatibility
    return unless bunk&.room && reservation

    room_gender = bunk.room.gender
    reservation_sex = reservation.sex&.downcase

    case room_gender
    when 'men'
      unless reservation_sex == 'male'
        errors.add(:bunk, "is in a men's room but reservation is for #{reservation.sex}")
      end
    when 'women'
      unless reservation_sex == 'female'
        errors.add(:bunk, "is in a women's room but reservation is for #{reservation.sex}")
      end
    end
  end
end
