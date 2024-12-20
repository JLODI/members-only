class PostsController < ApplicationController
  before_action :authenticate_member!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_member.posts.new(post_params)
      if @post.save
        redirect_to posts_path
      else
        render :new, status: :unprocessable_entity
      end
  end

  private
    def post_params
    params.expect(post: [:title, :body, :member_id, :image_url])
  end


end
