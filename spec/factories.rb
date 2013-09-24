FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "Article Number #{n}" }
    sequence(:content) { |n| "Article #{n} content" }
    # title "foo"
    # content "bar"
  end
end
