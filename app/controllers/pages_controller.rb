class PagesController < ApplicationController
  def home
    @articles = Article.limit 3
  end
end
