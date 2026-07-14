class Suburb < ApplicationRecord
  has_many :voting_places, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: { scope: :city }
  validates :city, presence: true
end
