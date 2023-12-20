# frozen_string_literal: true

# app/models/income_expenditure.rb
class IncomeExpenditure < ApplicationRecord
  belongs_to :user
  has_one :income, dependent: :destroy
  has_one :expenditure, dependent: :destroy

  accepts_nested_attributes_for :income, :expenditure

  validates :person_name, presence: true

  def disposable_income
    income_amount - expenditure_amount
  end

  def rating
    case calculate_ratio
    when 0..0.1 then 'A'
    when 0.1..0.3 then 'B'
    when 0.3..0.5 then 'C'
    else 'D'
    end
  end

  private

  def income_amount
    calculate_amount(income, :salary, :other)
  end

  def expenditure_amount
    calculate_amount(expenditure, :mortgage, :utilities, :travel, :food, :loan_repayment)
  end

  def calculate_ratio
    ratio = expenditure_amount.to_f / income_amount.to_f
    ratio.nan? ? 0 : ratio
  end

  def calculate_amount(record, *attributes)
    attributes.sum { |attr| record&.public_send(attr).to_i }
  end
end
