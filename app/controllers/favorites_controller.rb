class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.create(post_id: params[:post_id])
    @favorite.save
    # redirect_back(fallback_location: posts_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @favorite.destroy
    # redirect_back(fallback_location: posts_path)
  end
end
