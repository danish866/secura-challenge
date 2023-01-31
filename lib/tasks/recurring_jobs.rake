namespace :recurring_jobs do
  desc "Schedule a delayed job to calculate disbursements"
  task calculate_disbursements: :environment do
    DisbursementCreator.new.create_disbursement
  end
end