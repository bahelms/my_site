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
    it { should_not have_link("Sign Out") }

    describe "with invalid information" do
      before { click_button "Login" }

      it { should have_selector(".alert-notice") }
      it { should have_content("Invalid username/password") }
    end

    describe "with valid information" do
      before { signin admin }

      it { should have_content("The Office") }
      it { should have_link("Office", href: admin_path) }
      it { should have_link("Sign Out") }

      describe "signing out" do
        before { click_link "Sign Out" }

        it { should have_content("Recent Posts") }
        it { should_not have_link("Sign Out") }
        it { should_not have_link("Office") }
      end
    end
  end

end
