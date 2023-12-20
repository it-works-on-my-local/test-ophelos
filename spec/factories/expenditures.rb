# spec/factories/expenditures.rb

FactoryBot.define do
  factory :expenditure do
    mortgage { 1500.00 }
    utilities { 200.00 }
    travel { 500.00 }
    food { 300.00 }
    loan_repayment { 1000.00 }
  end
end
