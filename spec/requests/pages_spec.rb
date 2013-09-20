require 'spec_helper'

describe "Pages" do
  subject { page }

  describe "Home" do
    let!(:article1) { create(:article) }
    let!(:article2) { create(:article) }
    before { visit root_path }

    it { should have_title("BAHelms United") }

    describe "nav bar" do
      it { should have_link("Home", href: root_path) }
      it { should have_link("Archives", href: articles_path) }
      it { should have_link("Projects") }

      describe "clicking on Archives" do
        before { click_link 'Archives' }
      end
    end

    describe "blog feed" do
      it { should have_content("Recent Posts") }
      it { should have_link(article1.title, href: article_path(article1)) }
      it { should have_link(article2.title, href: article_path(article2)) }
      it { should have_content(article1.title) }
      it { should have_content(article2.title) }
      it { should have_content(published_date(article1.created_at)) }
      it { should have_content(published_date(article2.created_at)) }

      describe "clicking on an article title" do
        before { click_link article1.title }
        it { should have_content("Hello") }
      end
    end
  end
end
