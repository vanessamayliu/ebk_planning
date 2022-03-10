class Nonprofit < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :owner_user_id, :presence => true

  validates :status, :presence => true

  # Scopes

  def to_s
    name
  end

end
