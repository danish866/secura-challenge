require 'rails_helper'

RSpec.describe DisbursementCreator do
  describe "#create_disbursement" do
    let(:week_start) { Time.zone.now.beginning_of_week }
    let(:week_end) { Time.zone.now.end_of_week }
    let(:merchant1) { create :merchant }
    let(:merchant2) { create :merchant }
    let(:order1) { create :order, merchant: merchant1, amount: 50, completed_at: week_start + 1.days}
    let(:order2) { create :order, merchant: merchant1, amount: 100, completed_at: week_start + 2.days}
    let(:order3) { create :order, merchant: merchant2, amount: 200, completed_at: week_start + 3.days}
    let(:order4) { create :order, merchant: merchant2, amount: 300, completed_at: week_start + 4.days}
    
    before do
      order4.reload
      order3.reload
      order2.reload
      order1.reload
      merchant1.reload
      merchant2.reload
    end

    it "creates disbursements for all merchants" do
      disbursement_creator = DisbursementCreator.new
      disbursement_creator.create_disbursement
      debugger
      expect(Disbursement.count).to eq(2)
    end

    it "calculates the correct disbursement amount for each merchant" do
      disbursement_creator = DisbursementCreator.new
      disbursement_creator.create_disbursement
      debugger
      disbursement1 = Disbursement.find_by(merchant: merchant1)
      expect(disbursement1.amount).to eq(150.0 - (150.0 * 0.0095))

      disbursement2 = Disbursement.find_by(merchant: merchant2)
      expect(disbursement2.amount).to eq(500.0 - (500.0 * 0.0085))
    end
  end
end
