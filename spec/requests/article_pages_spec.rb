require 'spec_helper'

describe "Article Pages" do
  let(:admin) { create(:admin) }
  let(:article) { create(:article) }
  subject { page }

  describe "Archives" do
    before { visit articles_path }

    it { should have_title("Blog Archives") }

    describe "pagination" do
      before(:all) { 50.times { create(:article) } }
      after(:all) { Article.delete_all }

      it { should have_selector("div.pagination") }
      # it "should list each article" do
      #   Article.paginate(page: 1).each do |article|
      #     expect(subject).to have_selector("li", text: article.title)
      #   end
      # end
    end
  end

  describe "show article page" do
    before { visit article_path(article) }
    
    it { should have_content(article.title) }
    it { should have_content(article.content) }
    it { should have_content("Published") }
    it { should have_title(article.title) }
    it { should_not have_content("<p>") }

    context "when logged in as admin" do
      before do
        signin admin
        visit article_path(article)
      end

      it { should have_content(article.title) }
      it { should have_content(article.content) }
      it { should have_link("Delete Article") }
      it { should have_link("Edit Article") }

      describe "clicking Delete Article button" do
        it "should delete the current article" do
          expect { click_link "Delete Article" }.to change(Article, :count).by(-1)
        end
      end
    end
  end

  describe "edit article page" do
    before do
      signin admin
      visit article_path(article)
      click_link "Edit Article"
    end

    it { should have_title("Edit Article") }
    it { should have_content(article.title) }
    it { should have_selector(".article_form") }

    describe "posting" do
      context "with valid information", js: true do
        let(:new_title) { "New title" }
        let(:new_content) { "New Article Content" }
        before do
          fill_in "Title", with: new_title
          fill_tinymce(new_content)
          click_button "Post Article"
        end

        it { should have_title("New title") }
      end

      context "with invalid information" do
        
      end
    end
  end
end
