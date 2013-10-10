require 'spec_helper'

describe "Authentication" do
  let(:admin) { create(:admin) }
  subject { page }

  describe "signin" do
    before { visit signin_path }

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
      before do 
        fill_in "Username", with: admin.username
        fill_in "Password", with: admin.password
        click_button "Login"
      end

      it { should have_content("Welcome") }
    end
  end
end
