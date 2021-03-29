class SessionsController < ApplicationController
  def new
  	redirect_to login_path
  end

  def create
  	user = User.from_oauth(request.env['omniauth.auth'])
    session[:uid] = user.uid
    redirect_to '/'
  end

  def destroy
  	session.delete(:uid)
    redirect_to '/'
  end
end
