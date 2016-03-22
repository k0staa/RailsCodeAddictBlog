class CommentsController < ApplicationController
      http_basic_authenticate_with name: AUTHENTICATION['name'], password: AUTHENTICATION['password'],only: :destroy
  
  def create
    @article = Article.find(params[:article_id])
    if @article.comments.all.size < 50
         @comment = @article.comments.create(comment_params)
    end
    redirect_to article_path(@article)
  end

  def show
    article = Article.find(params[:id])
    @comments = article.comments.all
    render("index")
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    
    redirect_to comment_path(params[:article_id] )
  end
  
  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
