class TagsController < ApplicationController
  http_basic_authenticate_with name: AUTHENTICATION['name'], password: AUTHENTICATION['password'],except: [:index, :show]
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
    redirect_to administrator_index_url
    else
      render 'new'
    end
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to @tag
    else
      render 'edit'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to administrator_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name )
  end
end