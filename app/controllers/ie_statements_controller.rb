# app/controllers/ie_statements_controller.rb

class IeStatementsController < ApplicationController
  def new
    @ie_statement = IncomeExpenditure.new
  end

  def create
    @ie_statement = IncomeExpenditure.new(ie_statement_params)

    if @ie_statement.save
      redirect_to @ie_statement
    else
      render 'new'
    end
  end

  def show
    @ie_statement = IncomeExpenditure.find(params[:id])
    @disposable_income = @ie_statement.income - @ie_statement.expenditure
    @rating = @ie_statement.calculate_rating
  end

  private

  def ie_statement_params
    params.require(:income_expenditure).permit(:person_name, :income, :expenditure)
  end
end
