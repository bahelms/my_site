require 'spec_helper'

describe Article do
  let(:article) { build(:article) }
  subject { article }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should be_valid }

  describe "validations" do
    context "when title is not present" do
      before { subject.title = nil }
      it { should_not be_valid }
    end

    context "when content is not present" do
      before { subject.content = nil }
      it { should_not be_valid }
    end
  end
end
