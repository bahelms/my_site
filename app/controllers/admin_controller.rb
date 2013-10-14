class AdminController < ApplicationController
  before_action :authenticate

  def index
    @article = Article.new
  end
end
