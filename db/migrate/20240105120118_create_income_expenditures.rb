class CreateIncomeExpenditures < ActiveRecord::Migration[7.1]
  def change
    create_table :income_expenditures do |t|
      t.string :person_name
      t.timestamps
    end
  end
end
