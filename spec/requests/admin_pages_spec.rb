require 'spec_helper'

describe "Admin index" do
  let(:admin) { create(:admin) }
  subject { page }

  before do
    visit admin_path 
    signin admin
  end

  it { should have_content("The Office") }
  it { should have_title("The Office") }
  it { should have_link("Sign Out", href: signout_path) }
  it { should have_link("Office", href: admin_path) }
  it { should have_button("Write New Article") }
  it { should have_button("Post Article") }
  it { should have_selector(".article_form", visible: false) }

  describe "clicking Write New Article button" do
    before { click_button "Write New Article" }
    it "displays article form", js: true do
      expect(subject).to have_selector(".article_form", visible: true)
    end
  end
  
  describe "posting a new article" do
    before do
      visit admin_path
      signin admin
      click_button "Write New Article"
    end

    context "with invalid information" do
      it "should not create an article", js: true do
        expect { click_button "Post Article" }.not_to change(Article, :count)
      end

      describe "after submission", js: true do
        before { click_button "Post Article" }
        it { should have_content("error") }
      end
    end

    context "with valid information", js: true do
      before { post_article }

      it { should have_content("Your article has been posted.") }

      it "should create an article", js: true do
        expect do 
          visit admin_path
          click_button "Write New Article"
          post_article
        end.to change(Article, :count).by(1)
      end
    end
  end
end
