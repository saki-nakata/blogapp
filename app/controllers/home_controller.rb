class HomeController < ApplicationController
    def index
       @title="indexページ"
    end
    def about
        @message="aboutページ"
        render "home/about"
    end
end