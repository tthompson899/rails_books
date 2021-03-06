class SessionsController < ApplicationController
  def new
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/dashboards/#{session[:user_id]}"
    else
      flash[:error] = "Invalid Credentials"
      redirect_to :back
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end
end
