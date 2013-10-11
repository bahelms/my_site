module SessionsHelper
  def authenticate
    unless Admin.find_by(token: session[:token])
      redirect_to jimbonk_signin_url
    end
  end

  def signin(admin)
    session[:token] = admin.token
    self.current_admin = admin
  end

  def current_admin=(admin)
    @current_admin = admin
  end

  def current_admin
    @current_admin ||= Admin.find_by(token: session[:token])
  end

  def signed_in?
    !current_admin.nil?
  end

  def sign_out
    self.current_admin = nil
    session.delete(:token)
  end
end
