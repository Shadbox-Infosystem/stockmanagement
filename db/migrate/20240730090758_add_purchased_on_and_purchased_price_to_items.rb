# frozen_string_literal: true

class AddPurchasedOnAndPurchasedPriceToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :purchased_on, :date
    add_column :items, :purchased_price, :decimal, precision: 10, scale: 2
    add_column :items, :serial_number, :string

    add_index :items, :serial_number, unique: true
  end
end
