FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "Article Number #{n}" }
    sequence(:content) { |n| "Article #{n} content" }
  end

  factory :admin do
    sequence(:username) { |n| "Name#{n}" }
    password "foobar1"
    password_confirmation "foobar1"
  end
end
