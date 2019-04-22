class ArticlesController < ApplicationController

    def index 
        if session[:user_id]
            return @articles = Article.all
        else
            redirect_to(:controller => 'sessions', :action => 'login')
        end
    end

    def show
        if session[:user_id]
            @article = Article.find(params[:id])
        else
            redirect_to(:controller => 'sessions', :action => 'login')
        end
    end
    
    def new
        if session[:user_id]
            @article = Article.new
        else
            redirect_to(:controller => 'sessions', :action => 'login')
        end
    end

    def edit
        if session[:user_id]
            @article = Article.find(params[:id])
        else
            redirect_to(:controller => 'sessions', :action => 'login')
        end
    end

    def create
        if session[:user_id]
            @article = Article.new(article_params)

            if @article.save
                redirect_to @article
            else
                render 'new'
            end
        else
            redirect_to(:controller => 'sessions', :action => 'login')
        end
    end

    def update
        if session[:user_id]
            @article = Article.find(params[:id])
       
            if @article.update(article_params)
              redirect_to @article
            else
              render 'edit'
            end
        else
            redirect_to(:controller => 'sessions', :action => 'login')
        end
    end

    def destroy
        if session[:user_id]
            @article = Article.find(params[:id])
            @article.destroy
       
            redirect_to articles_path
        else
            redirect_to(:controller => 'sessions', :action => 'login')
        end
    end
       
    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
end
