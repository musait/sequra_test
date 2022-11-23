class AddDisbursementIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :disbursement, foreign_key: true
  end
end
