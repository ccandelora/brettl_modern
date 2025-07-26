class ReservationWeek < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :bunk_assignments, dependent: :destroy
  has_many :assigned_bunks, through: :bunk_assignments, source: :bunk

  def week_start
    res_date
  end

  def bunk_list_status
    if bunk_list_finalized?
      "finalized"
    elsif bunk_assignments.any?
      "generated"
    else
      "not_generated"
    end
  end

  def has_bunk_list?
    bunk_assignments.any?
  end

  def bunk_list_finalized?
    bunk_list_finalized == true
  end

  def all_assignables
    reservations + guests
  end

  def unassigned_assignables
    all_assignables.reject(&:has_bunk_assignment?)
  end
end
