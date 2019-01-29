class PostsController < ApplicationController

  def show
    @post = Post.find(id_params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def post_params
    params.require(:post).permit(:title, :studied_at, :study_time, :content, :study_method, :reflection, :next_study, :other).merge(user_id: current_user.id)
  end

  def id_params
    params.permit(:id)
  end
end


