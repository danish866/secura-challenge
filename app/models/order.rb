class Order < ApplicationRecord
  belongs_to :merchant 
  belongs_to :shopper 
  validates :amount, presence: true
  scope :completed, -> { where.not(completed_at: nil) } 
end
