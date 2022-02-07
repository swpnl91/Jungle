class SessionController < ApplicationController
  def new
  end

  def create
    # @user = User.find_by_email(params[:email])
    # if @user && @user.authenticate(params[:password]) #verifies that user exists and password is correct/authenticated
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect_to products_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end