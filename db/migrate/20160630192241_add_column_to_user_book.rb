class AddColumnToUserBook < ActiveRecord::Migration
  def change
    add_column :user_books, :qty, :integer
  end
end
