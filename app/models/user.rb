class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :nonprofits,
             foreign_key: "owner_user_id",
             dependent: :destroy

  # Indirect associations

  has_many   :events,
             through: :nonprofits,
             source: :events

  # Validations

  validates :name, presence: true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
