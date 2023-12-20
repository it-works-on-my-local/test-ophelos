class AddUserToIncomeExpenditures < ActiveRecord::Migration[7.1]
  def change
    add_reference :income_expenditures, :user, null: false, foreign_key: true
  end
end
