class Shopper < ApplicationRecord

  # Relations
  has_many :orders

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :nif, presence: true
end
