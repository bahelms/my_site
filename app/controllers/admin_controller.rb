class AdminController < ApplicationController
  before_action :authenticate

  def index
  end

  def authenticate
    unless Admin.find_by(session[:admin_id])
      redirect_to login_url, notice: "What do you think you are doing, eh?"
    end
  end
end
