class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :reservations, dependent: :destroy
  has_many :public_pins

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
