class CommentsController < ApplicationController
    
    def create
        if session[:user_id]
            @article = Article.find(params[:article_id])
            @current_user = User.find session[:user_id]  
            @values = comment_params
            @values[:commenter] = @current_user.username
            @comment = @article.comments.create(@values)
            redirect_to article_path(@article)
        else
            redirect_to(:controller => 'sessions', :action => 'login')
        end
    end

    def destroy
        if session[:user_id]
            @article = Article.find(params[:article_id])
            @comment = @article.comments.find(params[:id])
            @comment.destroy
            redirect_to article_path(@article)
        else
            redirect_to(:controller => 'sessions', :action => 'login')
        end
    end
     
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end
