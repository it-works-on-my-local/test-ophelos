# frozen_string_literal: true

# app/models/expenditure.rb
class Expenditure < ApplicationRecord
  belongs_to :income_expenditure

  validates :mortgage, presence: true
  validates :utilities, presence: true
  validates :travel, presence: true
  validates :food, presence: true
  validates :loan_repayment, presence: true
end
