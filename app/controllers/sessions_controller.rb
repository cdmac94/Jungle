class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])

      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
      flash.alert = "User not found"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.strip.downcase)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end