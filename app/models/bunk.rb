class Bunk < ApplicationRecord
  belongs_to :room
  belongs_to :owner, class_name: "User", optional: true
  belongs_to :preferred_user, class_name: "User", optional: true # Keep for backward compatibility during transition

  has_many :bunk_preferred_members, dependent: :destroy
  has_many :preferred_users, through: :bunk_preferred_members, source: :user
  has_many :bunk_assignments, dependent: :destroy
  has_many :reservations, through: :bunk_assignments

  validates :name, presence: true
  validates :bunk_type, presence: true, inclusion: { in: %w[Lower Upper Single] }
  validates :order, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :ordered, -> { order(:order) }
  scope :owned, -> { where.not(owner: nil) }
  scope :open, -> { where(owner: nil) }
  scope :with_preferred_user, -> { where.not(preferred_user: nil) } # Keep for backward compatibility
  scope :with_preferred_users, -> { joins(:bunk_preferred_members).distinct }
  scope :lower, -> { where(bunk_type: "Lower") }
  scope :upper, -> { where(bunk_type: "Upper") }
  scope :single, -> { where(bunk_type: "Single") }

  def owned?
    owner.present?
  end

  def open?
    owner.nil?
  end

  def has_preferred_user?
    preferred_user.present? || preferred_users.any?
  end

  def has_preferred_users?
    preferred_users.any?
  end

  def preferred_users_ordered
    bunk_preferred_members.includes(:user).ordered.map(&:user)
  end

  def add_preferred_user(user)
    return false if preferred_users.include?(user)

    rank = BunkPreferredMember.next_rank_for_bunk(self)
    new_preferred_member = bunk_preferred_members.create(user: user, rank: rank)
    new_preferred_member.persisted?
  end

  def remove_preferred_user(user)
    bunk_preferred_member = bunk_preferred_members.find_by(user: user)
    return false unless bunk_preferred_member

    removed_rank = bunk_preferred_member.rank
    bunk_preferred_member.destroy!

    # Reorder remaining ranks to fill the gap
    bunk_preferred_members.where("rank > ?", removed_rank).order(:rank).each_with_index do |bpm, index|
      bpm.update!(rank: removed_rank + index)
    end

    true
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
