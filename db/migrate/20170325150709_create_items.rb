# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.integer :quantity
      t.text :description

      t.timestamps
    end
  end
end
