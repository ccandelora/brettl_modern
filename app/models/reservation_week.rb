class ReservationWeek < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :bunk_assignments, dependent: :destroy
  has_many :assigned_bunks, through: :bunk_assignments, source: :bunk

  def week_start
    res_date
  end

  def bunk_list_status
    if bunk_assignments.any?
      'generated'  # Could be enhanced to track draft vs finalized
    else
      'not_generated'
    end
  end

  def has_bunk_list?
    bunk_assignments.any?
  end

  def all_assignables
    reservations + guests
  end

  def unassigned_assignables
    all_assignables.reject(&:has_bunk_assignment?)
  end
end
