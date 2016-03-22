class ArchiveController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc)
    @articles_months = @articles.group_by { |t| t.created_at.beginning_of_month }
  end
end
