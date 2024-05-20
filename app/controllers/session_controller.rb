class SessionController < ApplicationController
  layout 'authentication'

  def new
    redirect_to sites_path if current_user

    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to sites_path
    else
      @user = User.new
      @user.errors.add(:email, 'wrong email and/or password')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

end