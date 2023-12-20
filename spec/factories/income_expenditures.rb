# spec/factories/income_expenditures.rb

FactoryBot.define do
  factory :income_expenditure do
    person_name { 'John Doe' }
    association :user, factory: :user

    transient do
      with_income { true }
      with_expenditure { true }
    end

    after(:create) do |income_expenditure, evaluator|
      if evaluator.with_income
        create(:income, income_expenditure: income_expenditure)
      end

      if evaluator.with_expenditure
        create(:expenditure, income_expenditure: income_expenditure)
      end
    end
  end
end
