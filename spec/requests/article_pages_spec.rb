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

  describe "showing article" do
    before { visit article_path(article) }
    
    it { should have_content(article.title) }
    it { should have_content(article.content) }
    it { should have_content("Published") }
    it { should have_title(article.title) }
    it { should_not have_content("<p>") }
  end
end
