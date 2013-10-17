require 'spec_helper'

describe "Article Pages" do
  let(:admin) { create(:admin) }
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

  describe "posting a new article" do
    before do
      visit admin_path
      signin admin
      click_button "Write New Article"
    end

    it { should have_button("Post Article") }

    context "with invalid information" do
      it "should not create an article" do
        expect { click_button "Post Article" }.not_to change(Article, :count)
      end

      describe "after submission" do
        before { click_button "Post Article" }
        it { should have_content("error") }
      end
    end

    context "with valid information" do
      it "should create an article" do
        expect { click_button "Post Article" }.to change(Article, :count)
      end
    end
  end
end
