# frozen_string_literal: true

# app/models/income_expenditure.rb
class IncomeExpenditure < ApplicationRecord
  has_one :income, dependent: :destroy
  has_one :expenditure, dependent: :destroy

  accepts_nested_attributes_for :income, :expenditure

  validates :person_name, presence: true

  def disposable_income
    income_amount = income&.salary.to_i + income&.other.to_i
    expenditure_amount = expenditure&.mortgage.to_i + expenditure&.utilities.to_i + expenditure&.travel.to_i + expenditure&.food.to_i + expenditure&.loan_repayment.to_i
    income_amount - expenditure_amount
  end

  def rating
    ratio = calculate_ratio
    case ratio
    when 0..0.1
      'A'
    when 0.1..0.3
      'B'
    when 0.3..0.5
      'C'
    else
      'D'
    end
  end

  private

  def calculate_ratio
    income_amount = income&.salary.to_i + income&.other.to_i
    expenditure_amount = expenditure&.mortgage.to_i + expenditure&.utilities.to_i + expenditure&.travel.to_i + expenditure&.food.to_i + expenditure&.loan_repayment.to_i
    ratio = expenditure_amount.to_f / income_amount.to_f
    ratio.nan? ? 0 : ratio
  end
end
