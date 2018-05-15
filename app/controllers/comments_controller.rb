class CommentsController < ApplicationController

  include ApplicationHelper

before_action :set_comment, only: [:edit, :update, :destroy]

  def edit
    @blog_post = BlogPost.find(@comment.blog_post_id)
    not_owner(current_user, @comment)
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Comment Created Successfully"}
      else
        format.html {redirect_back(fallback_location: root_path, notice: "Comment Failed To Post")}
      end
    end
  end

  def update

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Comment Updated"}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy

    @comment.destroy
    respond_to do |format|
      format.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Comment Destroyed"}
    end
  end
private
def set_comment
  @comment = Comment.find(params[:id])
end
def comment_params
  params.require(:comment).permit(:user_id, :comment_entry, :blog_post_id)
end
end
