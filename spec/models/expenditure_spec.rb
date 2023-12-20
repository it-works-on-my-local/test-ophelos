# spec/models/expenditure_spec.rb
require 'rails_helper'

RSpec.describe Expenditure, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:mortgage) }
    it { is_expected.to validate_presence_of(:utilities) }
    it { is_expected.to validate_presence_of(:travel) }
    it { is_expected.to validate_presence_of(:food) }
    it { is_expected.to validate_presence_of(:loan_repayment) }
  end

  describe 'associations' do
    it { should belong_to(:income_expenditure) }
  end

  describe 'attributes' do
    it 'has valid attributes' do
      income_expenditure = FactoryBot.build(:income_expenditure)
      expenditure = FactoryBot.build(:expenditure, income_expenditure: income_expenditure)
      expect(expenditure).to be_valid
    end
  end
end
