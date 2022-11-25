class Order < ApplicationRecord

  # Relations
  belongs_to :merchant
  belongs_to :shopper
  belongs_to :disbursement, optional: true

  # Validations
  validates :merchant, presence: true
  validates :shopper, presence: true
  validates :amount, presence: true

  # Scopes
  scope :completed, -> { where.not(completed_at: nil) }
  scope :disbursed, -> { where.not(disbursement_id: nil) }
  scope :not_disbursed, -> {where(disbursement_id: nil)}
  scope :uncompleted, -> { where(completed_at: nil)}

  # Constants
  LIMIT_1 = 50
  LIMIT_2 = 300

  FEE_1 = 0.01
  FEE_2 = 0.0095
  FEE_3 = 0.0085


  # Retrieve all the orders that are completed but not disbursed yet from last week
  def self.orders_completed_but_not_disbursed
    number_of_last_week = Time.now.strftime("%U").to_i - 1
    orders_not_disbursed = Order.not_disbursed
    orders_to_disburse = []

    orders_not_disbursed.each do |o|
      if ((1.week.ago.beginning_of_day)..(Date.today.beginning_of_day)).cover?(o.completed_at)
        orders_to_disburse << o
      end
    end

    orders_to_disburse
  end

  # calculate order fee with the order's amount
  def calculate_fee
    order_amount = amount
    sum_of_disbursement = 0
    if order_amount.to_i < LIMIT_1
      sum_of_disbursement += order_amount * FEE_1
    elsif order_amount > LIMIT_1 && order_amount < LIMIT_2
      sum_of_disbursement += order_amount * FEE_2
    else order_amount > LIMIT_2
      sum_of_disbursement += order_amount * FEE_3
    end
    sum_of_disbursement.truncate(2)
  end
end
