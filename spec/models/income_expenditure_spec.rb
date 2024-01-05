require 'rails_helper'

RSpec.describe IncomeExpenditure, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'associations' do
    it { is_expected.to have_one(:income).dependent(:destroy) }
    it { is_expected.to have_one(:expenditure).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for(:income) }
    it { is_expected.to accept_nested_attributes_for(:expenditure) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:person_name) }
  end

  describe 'I.E ratings' do
    shared_examples 'calculates disposable income and rating' do |expenditures, income, expected_income, expected_rating|
      let!(:valid_income_expenditure) do
        valid_income = user.income_expenditures.create(person_name: 'anu')
        valid_income.create_expenditure!(expenditures)
        valid_income.create_income!(income)
        valid_income.reload
      end

      it 'calculates disposable income' do
        expect(valid_income_expenditure.disposable_income).to eq(expected_income)
      end

      it 'calculates rating' do
        expect(valid_income_expenditure.rating).to eq(expected_rating)
      end
    end

    context 'when rating is A' do
      include_examples 'calculates disposable income and rating', { mortgage: 0, utilities: 0, travel: 0, food: 0, loan_repayment: 0 }, { salary: 2000, other: 0 }, 2000, 'A'
    end

    context 'when rating is B' do
      include_examples 'calculates disposable income and rating', { mortgage: 100, utilities: 100, travel: 100, food: 0, loan_repayment: 0 }, { salary: 2000, other: 0 }, 1700.0, 'B'
    end

    context 'when rating is C' do
      include_examples 'calculates disposable income and rating', { mortgage: 200, utilities: 200, travel: 100, food: 100, loan_repayment: 100 }, { salary: 2000, other: 0 }, 1300.0, 'C'
    end

    context 'when rating is D' do
      include_examples 'calculates disposable income and rating', { mortgage: 500, utilities: 200, travel: 200, food: 300, loan_repayment: 400 }, { salary: 2000, other: 0 }, 400.0, 'D'
    end
  end
end
