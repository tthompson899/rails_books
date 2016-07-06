class CreateUserBooks < ActiveRecord::Migration
  def change
    create_table :user_books do |t|
      t.references :user, index: true
      t.references :book, index: true

      t.timestamps
    end
  end
end
