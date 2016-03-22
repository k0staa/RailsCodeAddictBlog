class ArticlesController < ApplicationController
         http_basic_authenticate_with name: AUTHENTICATION['name'], password: AUTHENTICATION['password'], except: [:index, :show, :feed]

  def index
      @paginated_articles = Article.search(params[:search], params[:page]) 
  end

 def show
      @article = Article.find(params[:id])
  end
    
  def new
      @article = Article.new
  end

  def edit
      @article = Article.find(params[:id])
  end
  
  def create
      @article = Article.new(article_params)
      if @article.save
         redirect_to @article
      else
        render 'new'
      end
  end

  def update
      @article = Article.find(params[:id])
     if @article.update(article_params)
        redirect_to @article
     else
        render 'edit'
    end
  end

  def destroy
      @article = Article.find(params[:id])
      @article.destroy 
      redirect_to articles_path
  end
  
 def feed
    @articles_rss = Article.order(created_at: :desc)
      render :template => 'articles/feed.rss.builder', :layout => false
  end
  
  private
  def article_params
     params.require(:article).permit(:title , :text,:tag_ids) #tag_ids: [:id])  #tags_attributes: [:id, :name, :_destroy])
  end
  
end
