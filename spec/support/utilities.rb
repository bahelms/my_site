include ApplicationHelper

def published_date(date)
  date.strftime('%B %-d, %Y')
end

def signin(admin)
  visit jimbonk_signin_path
  fill_in "Username", with: admin.username
  fill_in "Password", with: admin.password
  click_button "Login"
end
