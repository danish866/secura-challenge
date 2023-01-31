require 'rails_helper'

RSpec.describe Merchant, type: :model do
  let(:merchant) { build :merchant }

  it 'has a working factory' do 
    expect(merchant).to be_valid
    merchant.save
    expect(merchant).to be_persisted

    expect(merchant.name).to_not be_nil
    expect(merchant.email).to_not be_nil
    expect(merchant.cif).to_not be_nil
  end

  describe 'relationsips' do
    it { is_expected.to have_many(:orders) }
  end

  describe "validations" do
    subject { build(:merchant) }

    it { is_expected.to validate_presence_of(:cif) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end

end
