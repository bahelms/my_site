module SessionsHelper
  def authenticate
    unless Admin.find_by(session[:admin_id])
      redirect_to root_url, notice: "What do you think you are doing, eh?"
    end
  end
end
