class CommentsController < ApplicationController

  before_action :load_commentable

  def index
    @comments = @commentable.comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to comment_path(@comment, commentable: @comment, commentable_type: @comment.commentable_type), notice: "Comment created."
    else
      render :new
    end
  end


private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def load_commentable
    @commentable_type = params[:commentable_type] || params[:comment][:commentable_type]
    @commentable_id = params[:commentable] || params[:comment][:commentable]
    @commentable = @commentable_type.classify.constantize.find(@commentable_id)
  end

end
