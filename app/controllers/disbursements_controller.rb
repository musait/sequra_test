class DisbursementsController < ApplicationController
  before_action :retrieve_merchant

  def index
    raise "Week is mandatory" unless params[:week].present?
    raise "The week provided is not correct" if params[:week].to_i > Time.now.strftime("%U").to_i

    @disbursements = Disbursement.retrieve_disbursement_for_a_given_week_merchant(week: params[:week].to_i, merchant_id: params[:merchant_id])

    render json: @disbursements, status: 200
  end


  private

  def retrieve_merchant
    merchant = Merchant.find(params[:merchant_id]) if params[:merchant_id]
  end
end
