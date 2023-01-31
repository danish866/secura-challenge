class Merchant < ApplicationRecord
  has_many :orders
  validates :cif, :name, :email, presence: true
end
