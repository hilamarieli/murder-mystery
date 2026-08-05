class Persona < ApplicationRecord
  belongs_to :case
  has_one_attached :photo

  enum :narrative_role, {
    victim: 0,
    suspect: 1,
    witness: 2,
    detective: 3,
    other: 4
  }

  validates :name, presence: true
  validates :narrative_role, presence: true
end
