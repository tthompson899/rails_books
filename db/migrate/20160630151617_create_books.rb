class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :desc
      t.float :amount
      t.integer :qty

      t.timestamps
    end
  end
end
