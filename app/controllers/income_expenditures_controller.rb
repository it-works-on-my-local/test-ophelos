# frozen_string_literal: true

# app/controllers/income_expenditures_controller.rb
class IncomeExpendituresController < ApplicationController
  before_action :authorize_user, only: %i[edit update destroy]
  before_action :load_income_expenditure, only: %i[update destroy]

  def new
    @ie_statement = build_income_expenditure
  end

  def create
    @ie_statement = current_user.income_expenditures.new(ie_params)

    if @ie_statement.save
      redirect_to income_expenditures_path, notice: 'I&E Statement was successfully created.'
    else
      render :new
    end
  rescue StandardError => e
    handle_error(e, 'Failed to create I&E Statement')
  end

  def update
    if @ie_statement.update(ie_params)
      redirect_to income_expenditures_path, notice: 'I&E Statement was successfully updated.'
    else
      render :edit
    end
  rescue StandardError => e
    handle_error(e, 'Failed to update I&E Statement')
  end

  def destroy
    @ie_statement.destroy
    redirect_to income_expenditures_path, notice: 'I&E Statement was successfully deleted.'
  rescue StandardError => e
    handle_error(e, 'Failed to delete I&E Statement')
  end

  def index
    @ie_statements = IncomeExpenditure.all
  end

  private

  def authorize_user
    unless load_income_expenditure
      flash[:alert] = 'You are not authorized to perform this action.'
      redirect_to root_path
    end
  rescue StandardError => e
    handle_error(e, 'Authorization Error')
  end

  def ie_params
    params.require(:income_expenditure).permit(
      :person_name,
      income_attributes: %i[salary other],
      expenditure_attributes: %i[mortgage utilities travel food loan_repayment]
    )
  end

  def build_income_expenditure
    IncomeExpenditure.new.tap do |ie|
      ie.build_income
      ie.build_expenditure
    end
  end

  def load_income_expenditure
    @ie_statement = current_user.income_expenditures.find_by(id: params[:id])
  end

  def handle_error(exception, message)
    Rails.logger.error "#{message}: #{exception.message}"
    flash[:alert] = "#{message}. Please contact support."
    redirect_to root_path
  end
end
