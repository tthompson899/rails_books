class UpdateCostColumnUserBook < ActiveRecord::Migration
  def change
    change_column :user_books, :cost, :decimal, :precision => 2
  end
end
