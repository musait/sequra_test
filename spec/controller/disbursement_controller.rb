require 'rails_helper'

RSpec.describe DisbursementsController, type: :controller do

  describe "GET #index" do
    it "should retrieve all the disbursement for a given week" do
      week = Time.now.strftime("%U").to_i
      create(:disbursement)
      get :index, params: {week: week}
      expect(response).to have_http_status(:ok)
    end
  end

end