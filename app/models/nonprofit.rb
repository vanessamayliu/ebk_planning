class Nonprofit < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :status, :presence => true

  # Scopes

  def to_s
    name
  end

end
