class CalculateDisbursementsJob < ApplicationJob
  # queue_as :default

  # def perform(week_start: Time.zone.now.beginning_of_week, week_end: Time.zone.now.end_of_week) 
  #   merchants = Merchant.all 
  #   merchants.each do |merchant|
  #     # Calculate the total amount for all completed orders for this merchant 
  #     total_amount = merchant.orders.where(completed_at: week_start..week_end).sum(:amount) 

  #     # Calculate the fee based on the order amount 
  #     fee = if total_amount < 50 
  #           total_amount * 0.01 
  #           elsif total_amount >= 50 && total_amount <= 300 
  #             total_amount * 0.0095 
  #           else 
  #             total_amount * 0.0085 
  #           end 

  #     # Calculate the disbursement amount 
  #     disbursement_amount = total_amount - fee 

  #     # Create disbursement record 
  #     Disbursement.create!(merchant: merchant, week_start: week_start, week_end: week_end, amount: disbursement_amount)

  #   end 
  # end
end
