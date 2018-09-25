class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    u = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
    if u.present?
      session[:user_id] = u.id
      redirect_to root_path, alert: 'Wowowow'
    else
      redirect_to users_sign_in_path, alert: 'Password no es válido'
    end
  end

  def destroy
    reset_session
    redirect_to users_sign_in_path
  end
end
