require 'spec_helper'

describe "Authentication" do
  let(:admin) { create(:admin) }
  subject { page }

  describe "signin" do
    before { visit jimbonk_signin_path }

    it { should have_title("Admin Login") }
    it { should have_content("Username") }
    it { should have_content("Password") }
    it { should have_content("Login") }

    describe "with invalid information" do
      before { click_button "Login" }

      it { should have_selector(".alert-notice") }
      it { should have_content("Invalid username/password") }
    end

    describe "with valid information" do
      before { signin admin }
      it { should have_content("The Office") }
      it { should have_button("Logout") }
    end
  end

  describe "signout" do
    before do
      signin admin
      click_button "Logout"
    end

    it { should have_content("Recent Posts") }
  end
end
