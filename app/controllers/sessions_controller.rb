class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(username: params[:username])
    if admin && admin.authenticate(params[:password])
      signin admin
      redirect_to admin_url
    else
      flash.now[:notice] = "Invalid username/password"
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
