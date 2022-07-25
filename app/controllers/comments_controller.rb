class CommentsController < ApplicationController
  before_action :current_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.create(post_params)
    redirect_to post_path(@post)
  end
  
  def edit
    puts 
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
    params.require(:comment).permit(:author, :content, :post_id)
  end

  def current_comment
    puts params.keys
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end
end
