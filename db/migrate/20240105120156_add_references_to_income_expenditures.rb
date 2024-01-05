class AddReferencesToIncomeExpenditures < ActiveRecord::Migration[7.1]
  def change
    add_reference :incomes, :income_expenditure, foreign_key: true
    add_reference :expenditures, :income_expenditure, foreign_key: true
    add_reference :income_expenditures, :user, null: false, foreign_key: true
  end
end
