class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_category, only:[:new, :create]

  def index
    @posts = Post.all
    @category_parent_arrays = Category.where(ancestry: nil)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def new
    @post = Post.new
  end

  def get_category_children
    @category_children = Category.find("#{params[parent_id]}").children
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
    redirect_to post_path(@post), notice: '投稿されました'
    else
      render :new, alert: '投稿できませんでした'
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to posts_path, alert: '不正なアクセスです'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    redirect_to post_path(@post), notice: '投稿が更新されました'
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def set_category
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end
end
