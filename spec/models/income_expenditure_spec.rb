# spec/models/income_expenditure_spec.rb
require 'rails_helper'

RSpec.describe IncomeExpenditure, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:income).dependent(:destroy) }
    it { is_expected.to have_one(:expenditure).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for(:income) }
    it { is_expected.to accept_nested_attributes_for(:expenditure) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:person_name) }
  end

  describe 'methods' do
    let(:valid_income_expenditure) do
      FactoryBot.create(:income_expenditure, income: FactoryBot.build(:income, salary: 3000, other: 500))
    end

    it 'calculates disposable income' do
      expect(valid_income_expenditure.disposable_income).to eq(2500)
    end

    it 'calculates rating' do
      expect(valid_income_expenditure.rating).to eq('D')
    end
  end
end
