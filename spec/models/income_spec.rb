# spec/models/income_spec.rb
require 'rails_helper'

RSpec.describe Income, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:salary) }
    it { is_expected.to validate_presence_of(:other) }
  end

  describe 'associations' do
    it { should belong_to(:income_expenditure) }
  end

  describe 'attributes' do
    it 'has valid attributes' do
      income_expenditure = FactoryBot.build(:income_expenditure)
      income = FactoryBot.build(:income, income_expenditure: income_expenditure)
      expect(income).to be_valid
    end
  end
end
