# frozen_string_literal: true

# app/models/income.rb
class Income < ApplicationRecord
  belongs_to :income_expenditure

  validates :salary, presence: true
  validates :other, presence: true
end
