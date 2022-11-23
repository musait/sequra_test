class Order < ApplicationRecord

  # Relations
  belongs_to :merchant
  belongs_to :shopper
  belongs_to :disbursement

  # Validations
  validates :merchant, presence: true
  validates :shopper, presence: true
  validates :amount, presence: true

  # Scopes
  scope :completed, -> { where.not(completed_at: nil) }
  scope :disbursed, -> { where.not(disbursement_id: nil) }
  scope :not_disbursed, -> {where(disbursement_id: nil)}
  scope :uncompleted, -> { where(completed_at: nil)}
end
