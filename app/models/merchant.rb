class Merchant < ApplicationRecord

  # Relations
  has_many :orders
  has_many :disbursements

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :nif, presence: true
end
