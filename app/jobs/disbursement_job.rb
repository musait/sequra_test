class Disbursement < ApplicationJob
  queue_as :default

  def perform(*guests)
    order_to_disuburse = Order.completed.not_dibursed
  end
end