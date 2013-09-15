FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "Article Number #{n}" }
    sequence(:content) { |n| "Article #{n} content" }
  end
end
