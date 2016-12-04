class CommentsController < ApplicationController

  before_action :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end


private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def load_commentable
    if params[:article_id]
      @commentable = Article.find(params[:article_id])
    elsif params[:comment_id]
      @commentable = Comment.find(params[:comment_id])
    end
  end

  # def load_commentable
  #     @commentable = params[:commentable].classify.constantize.find(commentable_id)
  # end

  # def commentable_id
  #   params[(params[:commentable].singularize + "_id").to_sym]
  # end

end
