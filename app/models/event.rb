class Event < ApplicationRecord
  # Direct associations

  belongs_to :nonprofit

  # Indirect associations

  # Validations

  validates :confirmed, :presence => true

  validates :nonprofit_id, :presence => true

  # Scopes

  def to_s
    nonprofit.to_s
  end

end
