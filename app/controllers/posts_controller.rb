class PostsController < ApplicationController
  before_action :new_post, only: [:index, :new]

  def index
    @posts = Post.includes(:user).order(:created_at)
  end

  def new; end

  def create
    @post = current_user.posts.new(post_params)
    @post.save
    respond_with @post, location: posts_path, notice: 'New entry was added successfully'
  end

  private

  def new_post
    @post = Post.new
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:body)
  end
end
