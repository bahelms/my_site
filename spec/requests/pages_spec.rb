require 'spec_helper'

describe "Pages" do
  subject { page }

  describe "Home" do
    before { visit root_path }

    it { should have_title("My Site") }

    describe "nav bar" do
      it { should have_link("Home", href: root_path) }
      it { should have_link("Archives") }
      it { should have_link("Projects") }
    end

    describe "blog feed" do
      it { should have_content("Recent Blog Posts") }
    end
  end
end
