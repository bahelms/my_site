module SessionsHelper
  def authenticate
    unless Admin.find_by(token: session[:token])
      redirect_to signin_url
    end
  end
end
