class Guest < ApplicationRecord
  belongs_to :reservation_week
  has_one :bunk_assignment, as: :assignable, dependent: :destroy
  has_one :assigned_bunk, through: :bunk_assignment, source: :bunk

  validates :name, presence: true
  validates :sex, presence: true
  validates :guest_type, presence: true

  def has_bunk_assignment?
    bunk_assignment.present?
  end

  def gender_for_room
    sex&.downcase == "male" ? "men" : "women"
  end

  def display_name
    name
  end

  def effective_name
    name
  end

  def res_member_type
    guest_type
  end
end
