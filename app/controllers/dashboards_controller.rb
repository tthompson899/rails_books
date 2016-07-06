class DashboardsController < ApplicationController
  def show
    @loggedin = User.find(params[:id])
    @books = Book.all

    @orders = Book.joins(:user_books).select("books.title, books.amount")
              .select("user_books.qty, user_books.user_id, user_books.book_id, user_books.cost, user_books.id")
  end

  def destroy
    book = Book.find(params[:book])
    qty = book.qty + params[:qty].to_i
    book.update(qty: qty)
    order = UserBook.find(params[:id]).destroy
    redirect_to :back
  end
end
