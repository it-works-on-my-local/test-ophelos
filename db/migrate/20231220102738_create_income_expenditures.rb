# frozen_string_literal: true

# Migration to create the income_expenditures table
class CreateIncomeExpenditures < ActiveRecord::Migration[7.1]
  def change
    create_table :income_expenditures do |t|
      t.string :person_name
      t.float :income
      t.float :expenditure

      t.timestamps
    end
  end
end
