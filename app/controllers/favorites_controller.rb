class FavoritesController < ApplicationController
  before_action :snow_post
  
  def create
    @favorite = Favorite.create(user_id: current_user.id, post_id: params[:post_id])
    @favorites = Favorite.where(post_id: params[:post_id])
    @post.reload
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    favorite.destroy
    @favorites = Favorite.where(post_id: params[:post_id])
    @post.reload
  end

  private

  def snow_post
    @post = Post.find[params[:post_id]]
  end
end
