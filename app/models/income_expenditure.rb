# app/models/income_expenditure.rb
class IncomeExpenditure < ApplicationRecord
  validates :person_name, presence: true
  validates :income, presence: true
  validates :expenditure, presence: true

  def calculate_rating
    ratio = expenditure / income

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
end
