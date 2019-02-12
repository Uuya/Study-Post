class UsersController < ApplicationController

  def show
    @user  = User.find_by(id: params[:id])
    @posts = Post.where(user_id: params[:id]).order("studied_at desc")
    study_time_total = Post.where(user_id: params[:id]).sum(:study_time) * 60
    study_minutes_total = Post.where(user_id: params[:id]).sum(:study_minutes)
    @study_total = ((study_time_total + study_minutes_total) / 60.to_f).round(1)
    gon.posts = Post.where(user_id: params[:id])
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id), success: "アカウントを編集しました"
    else
      flash.now[:error] = "編集に失敗しました"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache)
  end
end
