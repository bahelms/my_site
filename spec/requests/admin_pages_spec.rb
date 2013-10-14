require 'spec_helper'

describe "Admin pages" do
  let(:admin) { create(:admin) }
  subject { page }

  describe "Admin index" do
    before do
      visit admin_path 
      signin admin
    end

    it { should have_content("The Office") }
    it { should have_title("The Office") }
    it { should have_link("Sign Out", href: signout_path) }
    it { should have_link("Office", href: admin_path) }
    it { should have_button("Write New Article") }
    it { should_not have_button("Post Article") }
  end
end
