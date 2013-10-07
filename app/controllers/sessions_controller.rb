class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(username: params[:username])
    if admin && admin.authenticate(params[:password])
      session[:token] = admin.token
      redirect_to admin_url
    else
      redirect_to root_url, notice: "You are not an administrator! Shame on you."
    end
  end
end
