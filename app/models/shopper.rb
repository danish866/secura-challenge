class Shopper < ApplicationRecord
  has_many :orders
  validates :nif, presence: true, uniqueness: true 
end
