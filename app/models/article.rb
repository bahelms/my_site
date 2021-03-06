class Article < ActiveRecord::Base
  validates :title, :content, presence: true
  default_scope -> { order("created_at desc") }
end
