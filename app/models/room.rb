class Room < ApplicationRecord
  has_many :bunks, dependent: :destroy
  has_many :bunk_assignments, through: :bunks

  validates :name, presence: true
  validates :gender, presence: true, inclusion: { in: %w[men women coed] }
  validates :order, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :women, -> { where(gender: 'women') }
  scope :men, -> { where(gender: 'men') }
  scope :coed, -> { where(gender: 'coed') }
  scope :ordered, -> { order(:order) }

  def to_s
    name
  end
end
