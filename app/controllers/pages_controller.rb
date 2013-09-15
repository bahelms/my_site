class PagesController < ApplicationController
  def home
    @articles = Article.all # limit: num gives a warning
  end
end
