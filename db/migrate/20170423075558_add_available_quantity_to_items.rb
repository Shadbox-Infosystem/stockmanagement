class AddAvailableQuantityToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :remaining_quantity, :integer
  end
end
