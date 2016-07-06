class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, through: :user_books
  validates :first_name, :last_name, :email, :age, presence: :true
  has_secure_password
  
end
