# frozen_string_literal: true

# Migration to create the expenditures table
class CreateExpenditures < ActiveRecord::Migration[7.1]
  def change
    create_table :expenditures do |t|
      t.references :income_expenditure, foreign_key: true
      t.float :mortgage
      t.float :utilities
      t.float :travel
      t.float :food
      t.float :loan_repayment

      t.timestamps
    end
  end
end
