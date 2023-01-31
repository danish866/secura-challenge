require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  let(:disbursement) { build :disbursement }

  it 'has a working factory' do 
    expect(disbursement).to be_valid
    disbursement.save
    expect(disbursement).to be_persisted

    expect(disbursement.amount).to_not be_nil
    expect(disbursement.week_start).to_not be_nil
    expect(disbursement.week_end).to_not be_nil
  end

  describe 'relationsips' do
    it { is_expected.to belong_to(:merchant) }
  end

  describe "validations" do
    subject { build(:disbursement) }

    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:week_start) }
    it { is_expected.to validate_presence_of(:week_end) }
  end

end
