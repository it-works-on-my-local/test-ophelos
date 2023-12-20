# spec/models/expenditure_spec.rb
require 'rails_helper'

RSpec.describe Expenditure, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:mortgage) }
    it { is_expected.to validate_numericality_of(:mortgage).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(1_000_000) }

    it { is_expected.to validate_presence_of(:utilities) }
    it { is_expected.to validate_numericality_of(:utilities).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(500_000) }

    it { is_expected.to validate_presence_of(:travel) }
    it { is_expected.to validate_numericality_of(:travel).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(500_000) }

    it { is_expected.to validate_presence_of(:food) }
    it { is_expected.to validate_numericality_of(:food).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(500_000) }

    it { is_expected.to validate_presence_of(:loan_repayment) }
    it { is_expected.to validate_numericality_of(:loan_repayment).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(500_000) }
  end

  describe 'associations' do
    it { should belong_to(:income_expenditure) }
  end

  describe 'attributes' do
    it 'has valid attributes' do
      income_expenditure = FactoryBot.build(:income_expenditure)
      expenditure = FactoryBot.build(
        :expenditure,
        income_expenditure: income_expenditure,
        mortgage: 100_000,
        utilities: 50_000,
        travel: 50_000,
        food: 50_000,
        loan_repayment: 50_000
      )
      expect(expenditure).to be_valid
    end
  end
end
