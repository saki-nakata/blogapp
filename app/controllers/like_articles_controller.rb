class LikeArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = current_user.like_articles
  end

end