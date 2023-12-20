# frozen_string_literal: true

# app/models/income.rb
class Income < ApplicationRecord
  belongs_to :income_expenditure

  MAX_SALARY = 1_000_000
  MAX_OTHER_INCOME = 500_000

  validates :salary, presence: true, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: MAX_SALARY }
  validates :other, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: MAX_OTHER_INCOME }
end
