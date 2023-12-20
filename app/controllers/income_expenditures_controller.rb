# frozen_string_literal: true

# app/controllers/income_expenditures_controller.rb
class IncomeExpendituresController < ApplicationController
  def new
    @ie_statement = IncomeExpenditure.new
  end

  def show
    @ie_statement = IncomeExpenditure.find(params[:id])
  end

  def create
    @ie_statement = IncomeExpenditure.new(ie_params)

    if @ie_statement.save
      redirect_to income_expenditures_path, notice: 'Income and expenditure statement was successfully created.'
    else
      render :new
    end
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
