namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Article.delete_all
    50.times do
      Article.create!(
        title:   Faker::Lorem.sentence.capitalize,
        content: Faker::Lorem.paragraphs.join
      )
    end
  end
end
