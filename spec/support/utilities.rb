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

def fill_tinymce(content)
  within_frame("article_content_ifr") do
    editor = page.find_by_id("tinymce")
    editor.native.send_keys(content)
  end
end

def post_article
  fill_in "Title", with: "TitleTest"
  fill_tinymce("Article Content Test")
  click_button "Post Article"
end
