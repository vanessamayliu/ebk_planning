class Nonprofit < ApplicationRecord
  # Direct associations

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
