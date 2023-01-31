# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    -> ruby-3.0.0

* System dependencies

* Configuration

* Database creation
    -> Run the migrations
    -> Seed data from this link "https://www.dropbox.com/s/wms8dlqzs6bqkul/backend%20challenge%20dataset.zip?dl=0"
       has been placed in "lib/seeds" directory

    -> Use this command to migrate data from json files to database
       rails db:seed

    -> Data is not useful unless we can add custom completed at dates for previous data where completed at was nil
       Order.where(completed_at: nil).limit(100).update_all(completed_at: Time.zone.now.beginning_of_week)

    -> For Manually creation of Disbursement run the rake task manually, it automatically runs on Monday each week at 9:00am
     
       rake recurring_jobs:calculate_disbursements



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)
    Need cron up and running for background jobs to work

    -> crontab -r
    -> whenever --update-crontab --set environment='development'
    -> crontab -e

* Running sample api endpoints on postman e.g

     http://localhost:3000/api/v1/disbursements?week_start=2023-01-30&week_end=2023-02-05&merchant_id=7

     http://localhost:3000/api/v1/disbursements?week_start=2023-01-30&week_end=2023-02-05
    


