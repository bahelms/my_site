require 'spec_helper'

describe "Admin pagen" do
  let(:admin) { create(:admin) }
  subject { page }

  describe "Admin index" do
    before { visit admin_path }

    context "before signing in" do
      it { should have_title("Admin Login") }
      it { should have_content("Username") }
      it { should have_content("Password") }
      it { should have_content("Login") }
    end

    describe "signing in with invalid information" do
      before { click_button "Login" }

      it "should redirect to root page" do
        expect(page).to have_title("BAHelms United")
      end
      it { should have_content("Recent Posts") }
      it { should have_content("You are not an administrator!") }
    end
    
    describe "signing in with valid information" do
      before do
        fill
      end
    end
  end
end
