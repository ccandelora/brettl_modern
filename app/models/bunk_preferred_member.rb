class BunkPreferredMember < ApplicationRecord
  belongs_to :bunk
  belongs_to :user

  validates :rank, presence: true, uniqueness: { scope: :bunk_id }
  validates :user_id, uniqueness: { scope: :bunk_id }
  validates :rank, numericality: { greater_than: 0 }

  scope :ordered, -> { order(:rank) }
  scope :for_bunk, ->(bunk) { where(bunk: bunk) }

  def self.next_rank_for_bunk(bunk)
    for_bunk(bunk).maximum(:rank).to_i + 1
  end
end
