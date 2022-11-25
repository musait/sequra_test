require 'rails_helper'

RSpec.describe Disbursement, type: :model do

  describe "method that retrieves disbursement for a given week and a given merchant" do

    it "should retrieve the disbursement without merchant" do
      disbursement = create(:disbursement)
      merchant =  create(:merchant)

      disbursements = Disbursement.retrieve_disbursement_for_a_given_week_merchant(Time.now.strftime("%U").to_i)

      result_expected = {week: Time.now.strftime("%U").to_i, amount: disbursement.amount }

      expect(disbursements).to eq(result_expected)
    end


    it "should retrieve the disbursement with merchant" do
      merchant =  create(:merchant)
      disbursement = create(:disbursement, merchant: merchant)

      disbursements = Disbursement.retrieve_disbursement_for_a_given_week_merchant(Time.now.strftime("%U").to_i, merchant.id)

      result_expected = {week: Time.now.strftime("%U").to_i, merchant_id: merchant.id, amount: disbursement.amount }

      expect(disbursements).to eq(result_expected)
    end
  end
end