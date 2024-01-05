# frozen_string_literal: true

# Migration to create the income table
class CreateIncomes < ActiveRecord::Migration[7.1]
  def change
    create_table :incomes do |t|
      t.float :salary
      t.float :other

      t.timestamps
    end
  end
end
