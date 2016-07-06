class AddQtyColumnToUserBook < ActiveRecord::Migration
  def change
    add_column :user_books, :cost, :decimal
  end
end
