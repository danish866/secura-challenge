require 'rails_helper'

RSpec.describe "Disbursements", type: :request do
  let(:merchant) { create :merchant }
  let(:shopper) { create :shopper }
  let(:order) { create :order, merchant: merchant, shopper: shopper }

  let(:params) do
    {
        week_start: Time.zone.now.beginning_of_week,
        week_end: Time.zone.now.end_of_week,
        merchant_id: merchant.id
    }
  end

  describe "GET /index" do
    before do 
      order.merchant_id = merchant.id
      order.shopper_id = shopper.id
      order.save
      DisbursementCreator.new.create_disbursement 
    end
    
    it 'should return disbursements when params are correct' do 
      get '/api/v1/disbursements', params: params

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["data"].size).to eq 1 
    end
  end
end
