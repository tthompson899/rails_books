class RemoveColumnCostUserBook < ActiveRecord::Migration
  def change
    remove_column :user_books, :cost, :decimal
  end
end
