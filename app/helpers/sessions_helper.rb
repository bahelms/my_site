module SessionsHelper
  def authenticate
    unless Admin.find_by(session[:token])
      redirect_to new_session_url
    end
  end
end
