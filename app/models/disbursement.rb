class Disbursement < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :merchant

  # This method should retrieve disbursement for a given week and a given merchant. It should return an hash to the controller with the data
  def self.retrieve_disbursement_for_a_given_week_merchant(week, merchant_id = nil)

    if merchant_id.present?
      disbursements = Disbursement.where(week: week, merchant_id: merchant_id)
      hash = {}
      hash[:week] = week
      hash[:amount] = disbursements.sum(&:amount)
      hash[:merchant_id] = disbursements.pluck(:merchant_id).join.to_i
      hash
    else

      disbursements = Disbursement.where(week: week)

      hash = {}
      hash[:week] = week
      hash[:amount] = disbursements.sum(&:amount)
      hash
    end
  end
end
