class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,   only: [:edit, :update, :destroy]
  include PostsHelper

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_path(@post.user_id), success: '投稿しました！'
    else
      flash.now[:error] = '投稿に失敗しました'
      render new_post_path
    end
  end

  def show
    @post = Post.find(id_params[:id])
  end

  def edit
    @post = Post.find(id_params[:id])
  end

  def update
    @post = Post.find(id_params[:id])
    if @post.update(post_params)
      redirect_to "/posts/#{@post.id}", success: '編集しました！'
    else
      flash.now[:error] = '編集に失敗しました'
      render :edit
    end
  end

  def destroy
    post = Post.find(id_params[:id])
    if post.destroy
      redirect_to user_path(post.user_id), success: '投稿を削除しました！'
    else
      flash.now[:error] = '削除に失敗しました'
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :learning_date, :study_time, :content, :study_method, :reflection, :next_study, :other, :study_minutes).merge(user_id: current_user.id)
  end

  def id_params
    params.permit(:id)
  end

  def correct_user
    post  = Post.find(id_params[:id])
    @user = post.user_id
    unless current_user?(@user)
      flash[:error] = "操作が受け付けられません"
      redirect_to(user_path(current_user))
    end
  end
end
