class CreateDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements do |t|
      t.references :merchant, null: false, foreign_key: true
      t.float :amount
      t.datetime :week_start
      t.datetime :week_end

      t.timestamps
    end
  end
end
