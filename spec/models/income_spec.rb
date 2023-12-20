# spec/models/income_spec.rb
require 'rails_helper'

RSpec.describe Income, type: :model do
  let(:max_salary) { 1_000_000 }
  let(:max_other_income) { 500_000 }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:salary) }
    it { is_expected.to validate_presence_of(:other) }

    it 'validates salary within range' do
      income = FactoryBot.build_stubbed(:income, salary: -1)
      expect(income).to be_invalid
      expect(income.errors[:salary]).to include('must be greater than or equal to 100')

      income = FactoryBot.build_stubbed(:income, salary: max_salary + 1)
      expect(income).to be_invalid
      expect(income.errors[:salary]).to include("must be less than or equal to #{max_salary}")

      income = FactoryBot.build_stubbed(:income, salary: max_salary)
      expect(income).to be_valid
    end

    it 'validates other income within range' do
      income_expenditure = FactoryBot.create(:income_expenditure)
      income = FactoryBot.build_stubbed(:income, income_expenditure: income_expenditure, other: -1)
      expect(income).to be_invalid
      expect(income.errors[:other]).to include('must be greater than or equal to 0')

      income = FactoryBot.build_stubbed(:income, income_expenditure: income_expenditure, other: max_other_income + 1)
      expect(income).to be_invalid
      expect(income.errors[:other]).to include("must be less than or equal to #{max_other_income}")

      income = FactoryBot.build_stubbed(:income, income_expenditure: income_expenditure, other: max_other_income)
      expect(income).to be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:income_expenditure) }
  end

  describe 'attributes' do
    it 'has valid attributes' do
      income_expenditure = FactoryBot.build_stubbed(:income_expenditure)
      income = FactoryBot.build_stubbed(:income, income_expenditure: income_expenditure)
      expect(income).to be_valid
    end
  end
end
