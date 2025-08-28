class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ] #ログイン必須のDeviseメソッド
    before_action :set_current_user_articles, only: [ :edit, :update ]

    def index
       @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
        @comments = @article.comments
    end

    def new
        @article = current_user.articles.build
    end

    def create
        @article = current_user.articles.build(article_params)
        if @article.save
            redirect_to article_path(@article), notice: '保存完了！'
        else
            flash.now[:error] = '保存に失敗'
            render :new
        end
    end

    def edit
    end

    def update
        if @article.update(article_params)
            redirect_to article_path(@article), notice: '更新完了！'
        else
            flash.now[:error] = '更新に失敗'
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        article = current_user.articles.find(params[:id])
        article.destroy!
        redirect_to root_path, status: :see_other, notice: '削除に成功!'
    end

    private def article_params
        params.require(:article).permit(:title, :content, :thumbnail)
    end

    private def set_current_user_articles
        @article = current_user.articles.find(params[:id])
    end

end