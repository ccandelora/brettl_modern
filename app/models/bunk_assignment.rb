class BunkAssignment < ApplicationRecord
  belongs_to :reservation_week
  belongs_to :assignable, polymorphic: true
  belongs_to :bunk

  validates :reservation_week_id, uniqueness: { scope: :bunk_id, message: "Bunk already assigned for this week" }
  validates :assignable_id, uniqueness: { scope: [ :reservation_week_id, :assignable_type ], message: "Assignment already has a bunk for this week" }

  # Ensure gender compatibility
  validate :gender_compatibility

  scope :for_week, ->(week) { where(reservation_week: week) }

  delegate :room, to: :bunk
  delegate :name, to: :assignable, prefix: true
  delegate :sex, to: :assignable

  # For compatibility with existing code
  def reservation
    assignable if assignable_type == "Reservation"
  end

  def guest
    assignable if assignable_type == "Guest"
  end

  def user
    assignable.user if assignable_type == "Reservation"
  end

  private

  def gender_compatibility
    return unless bunk&.room && assignable

    room_gender = bunk.room.gender&.downcase

    # Get the effective sex for the assignable
    assignable_sex = if assignable.is_a?(Reservation)
      # For reservations, use the effective user's sex
      effective_user = assignable.effective_user
      if effective_user
        effective_user.sex&.downcase
      else
        # For guest non-member reservations, use the reservation's sex field
        assignable.sex&.downcase
      end
    else
      # For guests, use their own sex
      assignable.sex&.downcase
    end

    case room_gender
    when "men"
      unless assignable_sex == "male"
        errors.add(:bunk, "is in a men's room but assignable is for #{assignable_sex}")
      end
    when "women"
      unless assignable_sex == "female"
        errors.add(:bunk, "is in a women's room but assignable is for #{assignable_sex}")
      end
    when "coed"
      # Coed rooms accept both male and female occupants
      unless %w[male female].include?(assignable_sex)
        errors.add(:bunk, "is in a coed room but assignable sex is invalid: #{assignable_sex}")
      end
    end
  end
end
