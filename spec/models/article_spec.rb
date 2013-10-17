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

  describe "saving order" do
    let!(:old_article) { create(:article, created_at: 1.day.ago) }
    let!(:new_article) { create(:article, created_at: 1.hour.ago) }

    it "should have the right articles in the right order" do
      expect(Article.all.to_a).to eq [new_article, old_article]
    end
  end
end
