class AdminController < ApplicationController
  before_action :authenticate

  def index
  end

  def authenticate
    unless Admin.find_by(session[:admin_id])
      redirect_to new_session_url
    end
  end
end
