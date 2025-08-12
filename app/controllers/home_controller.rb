class HomeController < ApplicationController
    def index
       @article = Article.first
    end
    def about
        @message="aboutページ"
        render "home/about"
    end
end