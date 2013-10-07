require 'spec_helper'

describe "Authentication" do
  let(:admin) { create(:admin) }
  subject { page }

  describe "signin" do
    before { visit admin_path }

    it { should have_title("Admin Login") }
    it { should have_content("Username") }
    it { should have_content("Password") }
    it { should have_content("Login") }

  end
end
