class Disbursement < ApplicationRecord
  belongs_to :merchant
  validates :amount, :week_start, :week_end, presence: true 

  scope :with_specific_merchant, -> (merchant_id, week_start, week_end) { where("merchant_id =? and (created_at::date between ? and ?)", merchant_id,week_start, week_end) }
  scope :with_all_merchant, -> (week_start, week_end) { where("(created_at::date between ? and ?)", week_start, week_end) }

end
