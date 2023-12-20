
# Clear existing records
IncomeExpenditure.destroy_all

# Create sample data
income_expenditure = IncomeExpenditure.create!(
  person_name: 'John Doe',
  user_id: 1
)

Income.create!(
  income_expenditure: income_expenditure,
  salary: 2800,
  other: 300
)

Expenditure.create!(
  income_expenditure: income_expenditure,
  mortgage: 500,
  utilities: 100,
  travel: 150,
  food: 500,
  loan_repayment: 1000
)
