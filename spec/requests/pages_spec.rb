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
      it { should have_link("Archives") }
      it { should have_link("Projects") }
    end

    describe "blog feed" do
      it { should have_content("Recent Posts") }
      it { should have_link(article1.title, href: article_path(article1)) }
      it { should have_content(article2.title) }
    end
  end
end
