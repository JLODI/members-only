class PostsController < ApplicationController

  before_action :authenticate_member!, except: [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_member.posts.new(post_params)
      if @post.save
        flash[:notice] = "Your Post has been submitted!"
        redirect_to posts_path
      else
        flash.now[:error] = @post.errors.full_messages.join ('<br/>')
        render :new, status: :unprocessable_entity
      end
  end

  private
    def post_params
    params.expect(post: [:title, :body, :member_id, :image_url])
  end


end
