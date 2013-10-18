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

def fill_tinymce
  within_frame("article_content_ifr") do
    editor = page.find_by_id("tinymce")
    editor.native.send_keys("Article Content Test")
  end
end
