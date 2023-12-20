# frozen_string_literal: true

# Migration to create the income_expenditures table
class CreateIncomeExpenditures < ActiveRecord::Migration[7.1]
  def change
    create_table :income_expenditures do |t|
      t.string :person_name

      t.timestamps
    end

    add_reference :incomes, :income_expenditure, foreign_key: true
    add_reference :expenditures, :income_expenditure, foreign_key: true
  end
end
