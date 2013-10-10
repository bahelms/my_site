class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(username: params[:username])
    if admin && admin.authenticate(params[:password])
      session[:token] = admin.token
      redirect_to admin_url
    else
      flash.now[:notice] = "Invalid username/password"
      render "new"
    end
  end
end
