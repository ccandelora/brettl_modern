class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :reservation_week
  has_one :bunk_assignment, as: :assignable, dependent: :destroy
  has_one :assigned_bunk, through: :bunk_assignment, source: :bunk

  validates :sex, presence: true
  validates :res_member_type, presence: true
  validates :reservation_type, presence: true, inclusion: { in: %w[myself other_member guest] }
  validate :guest_user_validation

  def has_bunk_assignment?
    bunk_assignment.present?
  end

  def gender_for_room
    sex&.downcase == "male" ? "men" : "women"
  end

  def display_name
    name
  end

  # Check if this is a reservation for the member themselves
  def member_reservation?
    reservation_type == "myself"
  end

  # Check if this is a reservation for another member
  def other_member_reservation?
    reservation_type == "other_member"
  end

  # Check if this is a reservation for someone else (guest)
  def guest_reservation?
    reservation_type == "guest"
  end

  # Check if this is a guest reservation for an existing member
  def guest_member_reservation?
    guest_reservation? && guest_user_id.present?
  end

  # Check if this is a guest reservation for a non-member
  def guest_non_member_reservation?
    guest_reservation? && guest_user_id.blank?
  end

  # Get the effective name to display
  def effective_name
    if member_reservation?
      user.display_name
    elsif other_member_reservation?
      user.display_name
    elsif guest_member_reservation?
      guest_user&.display_name || name
    else
      name
    end
  end

  # Get the effective user for bunk assignment purposes
  def effective_user
    if member_reservation?
      user
    elsif other_member_reservation?
      user
    elsif guest_member_reservation?
      guest_user
    else
      nil
    end
  end

  # Get the guest user if this is a guest reservation for a member
  def guest_user
    return nil unless guest_user_id.present?
    @guest_user ||= User.find_by(id: guest_user_id)
  end

  private

  def guest_user_validation
    if guest_reservation? && guest_user_id.present?
      unless User.exists?(guest_user_id)
        errors.add(:guest_user_id, "must be a valid user")
      end
    end
  end
end
