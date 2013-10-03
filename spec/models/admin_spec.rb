require 'spec_helper'

describe Admin do
  let(:admin) { build(:admin) }
  subject { admin }

  it { should respond_to :username }
  it { should respond_to :password_digest }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should be_valid }

  describe "validations" do
    context "when username is not present" do
      before { subject.username = nil }
      it { should_not be_valid }
    end

    context "when username is not unique" do
      before do
        same_name = subject.dup
        same_name.save
      end
      it { should_not be_valid }
    end

    context "when password is not present" do
      before { @user = build(:admin, password: nil) }
      specify { expect(@user).not_to be_valid }
    end

    context "when password_confirmation is not present" do
      before { subject.password_confirmation = nil }
      it { should_not be_valid }
    end
  end
end
