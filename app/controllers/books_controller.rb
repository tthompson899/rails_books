class BooksController < ApplicationController
  def new
  end

  def create
    user = User.find(session[:user_id])
    book = Book.new(title: params[:title], desc: params[:desc], amount: params[:amount], qty: params[:quantity], user_id: user.id)

    if book.save
      redirect_to "/dashboards/#{session[:user_id]}"
    else
      flash[:errors] = book.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(title: params[:title], desc: params[:desc], amount: params[:amount], qty: params[:quantity])
    redirect_to "/dashboards/#{session[:user_id]}"
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to :back
  end

  def purchase
    @book = Book.find(params[:id])
  end

  def buy
    book = Book.find(params[:id])
    amount = book.amount * params[:quantity].to_i
    quantity = book.qty - params[:quantity].to_i
    book.update(qty: quantity)

    user = User.find(session[:user_id])
    # Change it so there are 2 decimal places in the database .round(2)
    buy = UserBook.create(user_id: user.id, book_id: book.id, qty: params[:quantity], cost: amount)
    redirect_to "/dashboards/#{session[:user_id]}"
  end
end
