class Nonprofit < ApplicationRecord
  # Direct associations

  belongs_to :owner_user,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :contact_email, :presence => true

  validates :name, :presence => true

  validates :owner_user_id, :presence => true

  validates :status, :presence => true

  # Scopes

  def to_s
    name
  end

end
