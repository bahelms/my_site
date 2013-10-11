module SessionsHelper
  def authenticate
    unless Admin.find_by(token: session[:token])
      redirect_to jimbonk_signin_url
    end
  end
end
