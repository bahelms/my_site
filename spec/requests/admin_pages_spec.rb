require 'spec_helper'

describe "Admin pagen" do
  let(:admin) { create(:admin) }
  subject { page }

  describe "Admin index" do
    before { visit admin_path }

    it { should have_title("Admin Login") }
    it { should have_content("Username") }
    it { should have_content("Password") }
    it { should have_content("Login") }

    describe "signing in with invalid information" do
      before { click_button "Login" }

      it { should have_content("Admin Login") }
      it { should have_title("Admin Login") }
    end
    
    describe "signing in with valid information" do
      before do
        fill_in "Username", with: admin.username
        fill_in "Password", with: admin.password
        click_button "Login"
      end

     it { should have_content("Welcome") }
    end
  end
end
