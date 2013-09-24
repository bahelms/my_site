class PagesController < ApplicationController
  def home
    @articles = Article.all.first 3
  end
end
