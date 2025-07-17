class Bunk < ApplicationRecord
  belongs_to :room
  belongs_to :owner, class_name: 'User', optional: true
  has_many :bunk_assignments, dependent: :destroy
  has_many :reservations, through: :bunk_assignments

  validates :name, presence: true
  validates :bunk_type, presence: true, inclusion: { in: %w[Lower Upper Single] }
  validates :order, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :ordered, -> { order(:order) }
  scope :owned, -> { where.not(owner: nil) }
  scope :open, -> { where(owner: nil) }
  scope :lower, -> { where(bunk_type: 'Lower') }
  scope :upper, -> { where(bunk_type: 'Upper') }
  scope :single, -> { where(bunk_type: 'Single') }

  def owned?
    owner.present?
  end

  def open?
    owner.nil?
  end

  def assigned_for_week?(reservation_week)
    bunk_assignments.where(reservation_week: reservation_week).exists?
  end

  def assignment_for_week(reservation_week)
    bunk_assignments.find_by(reservation_week: reservation_week)
  end

  def to_s
    name
  end
end
