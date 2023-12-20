# frozen_string_literal: true

# app/controllers/income_expenditures_controller.rb
class IncomeExpendituresController < ApplicationController
  def new
    @ie_statement = IncomeExpenditure.new
    @ie_statement.build_income
    @ie_statement.build_expenditure
  end

  def create
    @ie_statement = IncomeExpenditure.new(ie_params)

    if @ie_statement.save
      redirect_to income_expenditure_path(@ie_statement), notice: 'I&E Statement was successfully created.'
    else
      render :new
    end
  end

  def update
    @ie_statement = IncomeExpenditure.find(params[:id])

    if @ie_statement.update(ie_statement_params)
      redirect_to @ie_statement, notice: 'I&E Statement was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ie_statement = IncomeExpenditure.find(params[:id])
    @ie_statement.destroy
    redirect_to income_expenditures_path, notice: 'I&E Statement was successfully deleted.'
  end

  def index
    @ie_statements = IncomeExpenditure.all
  end

  private

  def ie_params
    params.require(:income_expenditure).permit(
      :person_name,
      income_attributes: [:salary, :other],
      expenditure_attributes: [:mortgage, :utilities, :travel, :food, :loan_repayment]
    )
  end
end
