class CategoriesController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    if @category.has_children?
      @category_links = @category.children
    end
    @posts = @category.set_posts
  end
end
