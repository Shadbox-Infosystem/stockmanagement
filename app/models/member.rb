# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :orders
  has_many :items, through: :orders

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true, numericality: { only_integer: true }

  def self.import(file)
    spreadsheet = Roo::Excelx.new(file.path)
    header = spreadsheet.row(1)
    uploaded_members = []

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      member = new(row.to_hash.slice('name', 'email', 'phone'))
      if member.save
        uploaded_members << member
      else
        # Handle invalid members
        puts member.errors.full_messages
      end
    end

    uploaded_members
  end
end
