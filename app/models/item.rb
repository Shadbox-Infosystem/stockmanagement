# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :members, through: :orders

  validates :name, presence: true
  validates :category, presence: true
  validates :serial_number, uniqueness: true, allow_nil: true

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    uploaded_items = []

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      item = new(row.to_hash.slice('name', 'category', 'quantity', 'description', 'serial_number', 'purchased_on',
                                   'purchased_price'))

      item['remaining_quantity'] = item['quantity']

      if item.save
        uploaded_items << item
      else
        # Handle invalid items
        puts "Errors for row #{i}: #{item.errors.full_messages}"
      end
    end

    uploaded_items
  end
end
