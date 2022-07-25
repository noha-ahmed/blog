class CommentsController < ApplicationController
  before_action :current_post
  before_action :current_comment, only: [:edit, :update, :destroy]

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
    params.require(:comment).permit(:author, :content)
  end

  def current_post
    @post = Post.find(params[:post_id])
  end

  def current_comment
    puts params.keys
    # @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end
end
