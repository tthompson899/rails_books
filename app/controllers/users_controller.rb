class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/dashboards/#{session[:user_id]}"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :root
    end
  end

  private
  def user_params
    params.require(:register).permit(:first_name, :last_name, :email, :password, :password_confirmation, :age)
  end
end
