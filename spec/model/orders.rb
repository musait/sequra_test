require 'rails_helper'

RSpec.describe Order, type: :model do

  describe "method that retrieves the order completed but not disbursed" do

    it "should retrieve all the orders completed but not disbursed" do
      completed_order =  create(:order_not_disbursed)

      orderd_not_disbursed = Order.orders_completed_but_not_disbursed

      expect(Order.not_disbursed.where.not(completed_at: nil).to include(completed_order))
    end
  end

  describe "method that calculate fee for a given order" do

    it "should return the correct fee for a given order" do
      completed_order =  create(:order)
      pourcentage = 0.0095
      fee = (completed_order.amount.to_f * pourcentage).truncate(2)

      expect(completed_order.calculate_fee).to(eq(fee))
    end
  end

end