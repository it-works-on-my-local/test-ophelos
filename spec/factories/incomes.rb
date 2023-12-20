# spec/factories/incomes.rb

FactoryBot.define do
  factory :income do
    salary { 5000.00 }
    other { 1000.00 }
  end
end
