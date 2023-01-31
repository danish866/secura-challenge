# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'

#merchant data from json file
merchants_json = JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'merchants.json')))
merchants_json["RECORDS"].each do |merchant|
  Merchant.create(
    id: merchant["id"],
    name: merchant["name"],
    email: merchant["email"],
    cif: merchant["cif"]
  )
end


#shoppers data from json file
shoppers_data = JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'shoppers.json')))
shoppers_data["RECORDS"].each do |record|
  Shopper.create(
      id: record["id"],
      name: record["name"],
      email: record["email"],
      nif: record["nif"]
  )
end

#orders data from json file
orders_data = JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'orders.json')))
orders_data["RECORDS"].each do |record|
  Order.create(
    id: record["id"],
    merchant_id: record["merchant_id"],
    shopper_id: record["shopper_id"],
    amount: record["amount"],
    created_at: record["created_at"],
    completed_at: record["completed_at"]
  )
end