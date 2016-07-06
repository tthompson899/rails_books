class AddCostColumnDecimalToUserBook < ActiveRecord::Migration
  def change
    add_column :user_books, :cost, :decimal, :precision => 5, :scale => 2
  end
end
