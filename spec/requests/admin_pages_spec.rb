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
      
    end
    
    describe "signing in with valid information" do
      
    end
  end
end
