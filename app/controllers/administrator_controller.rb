class AdministratorController < ApplicationController
    http_basic_authenticate_with name: AUTHENTICATION['name'], password: AUTHENTICATION['password']
   def index
      @articles = Article.all
  end
end
