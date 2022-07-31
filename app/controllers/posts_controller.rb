class PostsController < ApplicationController
  before_action :current_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:new, :create]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
    @posts.each do |post|
      user = User.find(post.user_id)
      post.author = user.first_name + " " + user.last_name
    end
  end

  def show
  end

  def new
    @post = @user.posts.build
  end

  def create
    post = @user.posts.create(post_params)
    redirect_to posts_path
  end
  
  def edit
  end

  def update
    @post.update(post_params)

    redirect_to post_path(@post)
  end

  def destroy
    puts "IN DELETEEEE"
    @post.destroy

    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

  def current_post
    @post = Post.find(params[:id])
    user = User.find(@post.user_id)
    @post_author_name = user.first_name + " " + user.last_name;
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def authorize_user
    if current_user.id != @post.user_id
      redirect_to post_path(@post), notice: "Not Authorized User!"
    end
  end

  
end

