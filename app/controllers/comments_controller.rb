class CommentsController < ApplicationController
  before_action :current_post
  before_action :current_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_user, only: [:new, :create]

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.create(comment_params)
    puts @comment.post_id
    redirect_to post_path(@post)
  end
  
  def edit
  end

  def update
    @comment.update(comment_params)

    redirect_to post_path(@post)
  end

  def destroy
    puts "destroy Comment"
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit( :content, :user_id)
  end

  def current_post
    @post = Post.find(params[:post_id])
    user = User.find(@post.user_id)
    @post_author_name = user.first_name + " " + user.last_name
  end

  def current_comment
    @comment = @post.comments.find(params[:id])
    user = User.find(@comment.user_id)
    @comment_author_name = user.first_name + " " + user.last_name
  end

  def set_user
    @user = User.find(current_user.id)
  end

end
