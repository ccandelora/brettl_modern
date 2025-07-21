class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :reservations, dependent: :destroy
  has_many :public_pins
  has_many :owned_bunks, class_name: "Bunk", foreign_key: "owner_id", dependent: :nullify

  # Enums for sex and membership type
  enum :sex, {
    "Male" => "Male",
    "Female" => "Female",
    "Other" => "Other"
  }

  enum :membership_type, {
    "Full Member" => "Full Member",
    "Associate Member" => "Associate Member",
    "Social Member" => "Social Member",
    "Guest" => "Guest"
  }

  # Validations
  validates :sex, presence: true, inclusion: { in: %w[Male Female Other] }
  validates :membership_type, presence: true, inclusion: { in: [ "Full Member", "Associate Member", "Social Member", "Guest" ] }

  def admin?
    role == 2
  end

  def display_name
    name.present? ? name : email
  end

  def role_name
    admin? ? "Administrator" : "Member"
  end
end
