class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
before_filter :get_archive
  def get_archive
       @articles = Article.order(created_at: :desc)
       #@articles = Article.all.group_by { |post| post.created_at.strftime("%B") }
       @articles_months = @articles.group_by { |t| t.created_at.beginning_of_month }

  end
end
