class Book < ActiveRecord::Base
  has_many :user_books, dependent: :destroy
  has_many :users, through: :user_books
  
end
