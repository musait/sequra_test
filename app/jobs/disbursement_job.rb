class Disbursement < ApplicationJob
  queue_as :default

  def perform(*guests)
    order_to_disburse = Order.orders_completed_but_not_disbursed
    merchant_ids = order_to_disburse.pluck(:merchant_id)

    merchant_ids.each do |merchant_id|
      orders_to_process = order_to_disburse.where(merchant_id: merchant_id)
      week = orders_to_process.first.completed_at.strftime("%U").to_i
      sum_of_disbursement = 0
      orders_to_process.each do |order|
        sum_of_disbursement += order.calculate_fee
      end
      disbursement = Disbursement.create(amount: sum_of_disbursement, week: week, merchant_id: merchant_id)
      order_to_process.update_all(disbursement_id: disbursement.id)
    end
  end
end
