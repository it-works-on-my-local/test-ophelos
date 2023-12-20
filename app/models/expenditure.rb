# frozen_string_literal: true

# app/models/expenditure.rb
class Expenditure < ApplicationRecord
  belongs_to :income_expenditure

  validates :mortgage, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000 }
  validates :utilities, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 500_000 }
  validates :travel, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 500_000 }
  validates :food, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 500_000 }
  validates :loan_repayment, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 500_000 }
end
