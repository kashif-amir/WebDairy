class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to dashboards_new_path
    else
     flash.now[:danger] = 'Invalid email/passwordcombination'
     render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end
end
