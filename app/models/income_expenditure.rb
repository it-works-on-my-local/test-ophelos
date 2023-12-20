# frozen_string_literal: true

# app/models/income_expenditure.rb
class IncomeExpenditure < ApplicationRecord
  has_one :income
  has_one :expenditure

  validates :person_name, presence: true
end
