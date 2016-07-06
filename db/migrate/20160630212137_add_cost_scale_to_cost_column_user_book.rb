class AddCostScaleToCostColumnUserBook < ActiveRecord::Migration
  def change
    change_column :user_books, :cost, :decimal, precision: 10, :scale => 2
  end
end
