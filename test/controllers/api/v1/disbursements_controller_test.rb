require "test_helper"

class Api::V1::DisbursementsControllerTest < ActionDispatch::IntegrationTest
 
  test "index with specific merchant and date range" do
    
    merchant = Merchant.create(name: "Merchant1",cif: "B124563")
    disbursements = Disbursement.create!(
      {merchant: merchant, week_start: Time.zone.now.beginning_of_week, week_end: Time.zone.now.end_of_week, amount: 10.0})
      
    get api_v1_disbursements_path, params: {merchant_id: merchant.id, week_start: Time.zone.now.beginning_of_week, week_end:Time.zone.now.end_of_week}
    assert_response :success
  end

  test "index with all merchants and date range" do
    merchant = Merchant.create(name: "Merchant2",cif: "B1245639")
    disbursements = Disbursement.create!(
      {merchant: merchant, week_start: Time.zone.now.beginning_of_week, week_end: Time.zone.now.end_of_week, amount: 20.0}
    )
    get api_v1_disbursements_path, params: {week_start: Time.zone.now.beginning_of_week, week_end: Time.zone.now.end_of_week}
    assert_response :success
  end

  test "index with missing week start or week end" do
    get api_v1_disbursements_path, params: {week_start: Time.zone.now.beginning_of_week}
    assert_response :bad_request
  end
end
